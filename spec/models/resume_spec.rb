require_relative '../rails_helper'

describe Resume do
  it "find_by_id with invalid id should return nil" do
    resume = Resume.find_by_id(RSpec.configuration.invalid_id)
    expect(resume).to be_nil
  end
  
  it "find with invalid id should raise ActiveRecord::RecordNotFound" do
    expect{ Resume.find(RSpec.configuration.invalid_id) }.to raise_error(ActiveRecord::RecordNotFound)
  end

  it "find by id" do
    resume = Resume.find_by_id(RSpec.configuration.valid_resume_id)
    expect(resume).not_to be_nil
  end
  
  it "can find using person" do
    person = Person.find(RSpec.configuration.valid_person_id)
    resume = Resume.for_person(person)
    expect(resume).not_to be_nil
  end

  it "find by person with invalid value should raise ActiveRecord::RecordNotFound" do
    expect(Resume.for_person('John Doe').count).to be == 0
  end
  
  it "resume must belong to a person" do
    resume = Resume.find_by_id(RSpec.configuration.valid_resume_id)
    expect(resume.person).to_not be_nil
  end
  
  it "resume should have jobs" do
    resume = Resume.find_by_id(RSpec.configuration.valid_resume_id)
    expect(resume.jobs.length).to be > 0
  end
end
