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

  it 'since should only return jobs that started on/after the date or were still active on it' do
    test_year = 2018
    since = Date.new(test_year, 1, 1)

    get :jobs, :params => {id: 1, since: "1/1/#{test_year}"}, format: 'json'
    expect(response.ok?).to be true

    jobs = JSON.parse(response.body)['jobs']
    expect(jobs).not_to be_empty

    jobs.each do |job|
      started_on_or_after = Date.parse(job['start_date']) >= since
      active_on_since = job['end_date'].nil? || Date.parse(job['end_date']) >= since
      expect(started_on_or_after || active_on_since).to be true
    end
  end

  it 'since should include jobs that started before the date but ran through it' do
    resume = Resume.find(1)
    company = Company.create!(name: 'since-spec company')
    spanning = Role.create!(title: 'since-spec spanning role', company: company, resume: resume,
                            start_date: DateTime.new(1990, 1, 1), end_date: DateTime.new(1991, 1, 1))
    ended_before = Role.create!(title: 'since-spec ended role', company: company, resume: resume,
                                start_date: DateTime.new(1980, 1, 1), end_date: DateTime.new(1981, 1, 1))

    get :jobs, :params => {id: 1, since: "6/1/1990"}, format: 'json'
    expect(response.ok?).to be true

    titles = JSON.parse(response.body)['jobs'].map { |j| j['title'] }
    expect(titles).to include(spanning.title)
    expect(titles).not_to include(ended_before.title)
  end
end
