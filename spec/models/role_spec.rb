require_relative '../rails_helper'

describe Role do
  before(:context) do
    resume = Resume.find(RSpec.configuration.valid_resume_id)
    resume.jobs.each do |job|
      if job.id == RSpec.configuration.valid_job_id
        @role = job
      end
    end
  end
  
  it "role should belong to a company" do
    expect(@role.company).to_not be_nil
  end
  
  it "role should have at least one associated project" do
    expect(@role.projects.length).to be > 0
  end
end
