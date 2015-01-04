require_relative '../../app' # <== the Sinatra app
require_relative '../spec_setup'
require 'rack/test'

describe Resume::Models::Person do
  include Rack::Test::Methods
  
  it "find_by_id with invalid id should return nil" do
    person = Resume::Models::Person.find_by_id(RSpec.configuration.invalid_id)
    expect(person).to be_nil
  end
  
  it "find with invalid id should raise ActiveRecord::RecordNotFound" do
    expect{ Resume::Models::Person.find(RSpec.configuration.invalid_id) }.to raise_error(ActiveRecord::RecordNotFound)
  end
  
  it "find by id" do
    person = Resume::Models::Person.find(RSpec.configuration.valid_person_id)
    expect(person.name).to eq(RSpec.configuration.info[:name])
  end
  
  it "find by uuid" do
    person = Resume::Models::Person.find_by_uuid(RSpec.configuration.info[:uuid])
    expect(person.name).to eq(RSpec.configuration.info[:name])
  end
  
end