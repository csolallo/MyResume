require 'rails_helper'
require 'json'

def generator(*enumerables)
  lazies = enumerables.collect { |enumerable| enumerable.lazy }
  lazies
end

def next_items(enumerators)
  done = false

  while not done do
    items = []
    enumerators.each do |l|
      begin  
        items << l.next
      rescue StopIteration
        items << nil
      end
    end

    non_nils_count = items.inject(0) { |acc, item| acc +=1 unless item.nil?; acc }
    if non_nils_count > 0
      yield items
    end

    # we are done only if the array contaiins only nils
    done = non_nils_count == 0
  end
end

RSpec.describe Api::V1::ResumeController, type: :controller do

  it 'there should be no jobs that have no corresponding company, and no companies with no associated jobs' do
    get :jobs, :params => { id: 1 }, format: 'json'
    expect(response.ok?).to be true

    expect { $history = JSON.parse(response.body) }.not_to raise_error
    
    #get all the company ids
    companies = $history['companies'].inject([]) { |arr, item| arr << item['id']; arr }
    companies.sort!
    
    # get all the companies referenced in jobs
    working = $history['jobs'].inject([]) { |arr, item| arr << item['company_id']; arr }
    comp_refs = working.uniq.sort!

    expect(companies.size).to eq(comp_refs.size)

    g = generator(companies, comp_refs)
    next_items(g) do |items|
      expect(items[0]).to eq(items[1])
    end
  end

  it 'there should be no jobs prior to the since job if it is specified' do
    test_year = 2018    
    
    get :jobs, :params => {id: 1, since: "1/1/#{test_year}"}, format: 'json'
    expect(response.ok?).to be true

    $resume = JSON.parse(response.body)
    
    #jobs are returned sorted by date in descending order so we just need to check the final job
    earliest_job = $resume['jobs'][-1]
    date = Date.parse(earliest_job["start_date"])
    expect(date.year).to be >= test_year
  end
end
