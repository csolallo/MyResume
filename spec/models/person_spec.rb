require_relative '../rails_helper'

describe Person do
  it "find_by_id with invalid id should return nil" do
    person = Person.find_by_id(RSpec.configuration.invalid_id)
    expect(person).to be_nil
  end
  
  it "find with invalid id should raise ActiveRecord::RecordNotFound" do
    expect{ Person.find(RSpec.configuration.invalid_id) }.to raise_error(ActiveRecord::RecordNotFound)
  end
  
  it "find by id" do
    person = Person.find(RSpec.configuration.valid_person_id)
    expect(person.name).to eq(Rails.application.config.info[:name])
  end
  
  it "find by uuid" do
    person = Person.find_by_uuid(Rails.application.config.info[:uuid])
    expect(person.name).to eq(Rails.application.config.info[:name])
  end
  
  it "person should have one resume" do
    person = Person.find(RSpec.configuration.valid_person_id)
    expect(person.resume).not_to be_nil
  end
  
  it "person should have certificates" do
    person = Person.find(RSpec.configuration.valid_person_id)
    expect(person.certificates.length).to be > 0
  end
  
  it "person should have career highlights" do
    person = Person.find(RSpec.configuration.valid_person_id)
    expect(person.highlights.length).to be > 0
  end
end
