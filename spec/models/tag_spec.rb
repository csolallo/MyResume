require_relative '../../app' # <== the Sinatra app
require_relative '../spec_setup'
require 'rack/test'

describe Resume::Models::Role do
  include Rack::Test::Methods

  it "a resume should have tags" do
    resume = Resume::Models::Resume.find(RSpec.configuration.valid_resume_id)
    tags = Resume::Models::Tag.find_by_resume(resume)
    
    expect(tags.length).to be > 0
  end
end