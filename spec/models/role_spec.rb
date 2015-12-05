require_relative '../../app' # <== the Sinatra app
require_relative '../spec_setup'
require 'rack/test'

describe Resume::Models::Role do
  include Rack::Test::Methods

  before(:context) do
    resume = Resume::Models::Resume.find(RSpec.configuration.valid_resume_id)
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