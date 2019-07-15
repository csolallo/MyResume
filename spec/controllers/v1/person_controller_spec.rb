require 'rails_helper'
require 'json'

RSpec.describe Api::V1::PersonController, type: :controller do
  it "fetching an invalid person returns a 404" do
    get :resume, :uuid => 'blah'
    expect(response.status).to eq(404)
  end

  it "info method is valid" do
    get :info, :uuid => RSpec.configuration.info[:uuid], :format => 'json'
    expect(response.ok?).to be true

    #ensure we get valid json
    expect { $info = JSON.parse response.body }.not_to raise_error
    expect($info['name']).to eq(RSpec.configuration.info[:name]);
  end

  it "education method is valid" do
    get :education, :uuid => RSpec.configuration.info[:uuid], :format => 'json'
    expect(response.ok?).to be true

    expect { $arrEducation = JSON.parse response.body }.not_to raise_error
    expect($arrEducation.length).to be > 0

    education = $arrEducation[0]
    expect(education['origin']).to eq(RSpec.configuration.education[:origin])
    expect(education['year']).to eq(RSpec.configuration.education[:year])
  end

  it "highlights method is valid" do
    get :highlights, :uuid => RSpec.configuration.info[:uuid], :format => 'json'
    expect(response.ok?).to be true

    expect { $arrHighlights = JSON.parse response.body }.not_to raise_error
    expect($arrHighlights.length).to be > 0
  end

  it "resume method is valid" do
    get :resume, :uuid => RSpec.configuration.info[:uuid], :format => 'json'
    expect(response.ok?).to be true

    expect { $resume = JSON.parse response.body }.not_to raise_error
    expect($resume['resume']).to eq(RSpec.configuration.valid_resume_id)
  end
end
