require_relative '../rails_helper'

describe Project do
  before(:context) do
    projects = Project.in_resume(RSpec.configuration.valid_resume_id)
    projects.each do |proj|
      if proj.id == RSpec.configuration.valid_project_id
        @project = proj
      end
    end
  end

  it "project should have at least one accomplishment" do
    expect(@project.accomplishments.length).to be > 0
  end
  
  it "project should have some tags" do
    expect(@project.tags.length).to be > 0
  end
  
  it "project should have apps" do
    expect(@project.apps.length).to be > 0
  end
end
