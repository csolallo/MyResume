require_relative '../../app'
require_relative '../spec_setup'
require 'rack/test'
require 'json'

describe 'Person routes' do
  include Rack::Test::Methods
  
  def app
    Resume::App
  end
  
  it "fetching an invalid person returns a 404" do
    get '/people/blah-blah-blah/resume'
    $stdout.puts last_response.status
    expect(last_response.status).to eq(404)
  end
  
  it "info method is valid" do
    get "/people/#{RSpec.configuration.info[:uuid]}/info"
    expect(last_response.ok?).to be true

    #ensure we get valid json
    expect { $info = JSON.parse last_response.body }.not_to raise_error
    expect($info['name']).to eq(RSpec.configuration.info[:name]);
  end
  
  it "education method is valid" do
    get "/people/#{RSpec.configuration.info[:uuid]}/education"
    expect(last_response.ok?).to be true
    
    expect { $arrEducation = JSON.parse last_response.body }.not_to raise_error
    expect($arrEducation.length).to be > 0
    
    education = $arrEducation[0]
    expect(education['origin']).to eq(RSpec.configuration.education[:origin])
    expect(education['year']).to eq(RSpec.configuration.education[:year])
  end
  
  it "highlights method is valid" do
    get "/people/#{RSpec.configuration.info[:uuid]}/highlights"
    expect(last_response.ok?).to be true
    
    expect { $arrHighlights = JSON.parse last_response.body }.not_to raise_error
    expect($arrHighlights.length).to be > 0
  end
  
  it "resume method is valid" do
    get "/people/#{RSpec.configuration.info[:uuid]}/resume"
    expect(last_response.ok?).to be true
    
    expect { $resume = JSON.parse last_response.body }.not_to raise_error
    expect($resume['resume']).to eq(RSpec.configuration.valid_resume_id)
    
  end
end