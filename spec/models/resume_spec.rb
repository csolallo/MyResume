require_relative '../../app' # <== the Sinatra app
require_relative '../spec_setup'
require 'rack/test'

describe Resume::Models::Resume do
  include Rack::Test::Methods

  it "find_by_id with invalid id should return nil" do
    resume = Resume::Models::Resume.find_by_id(RSpec.configuration.invalid_id)
    expect(resume).to be_nil
  end
  
  it "find with invalid id should raise ActiveRecord::RecordNotFound" do
    expect{ Resume::Models::Resume.find(RSpec.configuration.invalid_id) }.to raise_error(ActiveRecord::RecordNotFound)
  end

  it "find by id" do
    resume = Resume::Models::Resume.find_by_id(RSpec.configuration.valid_resume_id)
    expect(resume).not_to be_nil
  end
  
  it "can find using person id" do
    resume = Resume::Models::Resume.find_by_person_id(RSpec.configuration.valid_person_id)
    expect(resume).not_to be_nil
    
    resume = Resume::Models::Resume.find_by_person(RSpec.configuration.valid_person_id)
    expect(resume).not_to be_nil
  end
  
  it "can find using person object" do
    person = Resume::Models::Person.find(RSpec.configuration.valid_person_id)
    resume = Resume::Models::Resume.find_by_person(person)
    expect(resume).not_to be_nil
  end
  
  it "find by person with invalid value should raise ActiveRecord::RecordNotFound" do
    expect { Resume::Models::Resume.find_by_person('John Doe') }.to raise_error(ActiveRecord::RecordNotFound)
  end
end