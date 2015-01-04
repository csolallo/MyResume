require_relative '../../app'
require_relative '../spec_setup'
require 'rack/test'
require 'json'

describe 'Resume routes' do
  include Rack::Test::Methods
  
  def app
    Resume::App
  end

  it "fetching an invalid resume returns 404" do
    get "/resumes/blah-blah-blah/jobs"
    expect(last_response.status).to eq(404)
  end
  
  it "job method is valid" do
    get "/resumes/#{RSpec.configuration.valid_resume_id}/jobs"
    expect(last_response.ok?).to be true
    
    expect { $jobs = JSON.parse last_response.body }.not_to raise_error
    expect($jobs['companies'].length).to be > 0
    expect($jobs['jobs'].length).to be > 0
  end
  
  it "job method with since parameter is valid" do
    get "/resumes/#{RSpec.configuration.valid_resume_id}/jobs?since=#{RSpec.configuration.last_job_start_date}"
    expect(last_response.ok?).to be true

    expect { $last_job = JSON.parse last_response.body }.not_to raise_error
    expect($last_job['companies'].length).to be == 1
    expect($last_job['jobs'].length).to be == 1
  end
  
  it "job method with invalid since parameter returns 404" do
    #invalid date
    get "/resumes/#{RSpec.configuration.valid_resume_id}/jobs?since=abc"
    expect(last_response.status).to eq(404)

    #invalid date
    get "/resumes/#{RSpec.configuration.valid_resume_id}/jobs?since=13/1/2014"
    expect(last_response.status).to eq(404)

    #future date    
    get "/resumes/#{RSpec.configuration.valid_resume_id}/jobs?since=12/1/2032"
    expect(last_response.status).to eq(404)
  end

  it "tags method is valid" do
    get "/resumes/#{RSpec.configuration.valid_resume_id}/tags"
    expect(last_response.ok?).to be true
    
    expect { $tags = JSON.parse last_response.body }.not_to raise_error
    expect($tags.length).to be > 1
  end
end
