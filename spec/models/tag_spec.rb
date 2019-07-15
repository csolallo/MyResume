require_relative '../rails_helper'

describe Role do
  it "a resume should have tags" do
    resume = Resume.find(RSpec.configuration.valid_resume_id)
    tags = Tag.in_resume(resume)
    
    expect(tags.length).to be > 0
  end
end
