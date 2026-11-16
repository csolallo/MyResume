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

  describe ".since" do
    let(:company) { Company.create!(name: 'since-spec company') }
    let(:resume) { Resume.find(RSpec.configuration.valid_resume_id) }
    let(:since_date) { DateTime.new(2015, 6, 1) }

    def make_role(title, start_date, end_date)
      Role.create!(title: title, start_date: start_date, end_date: end_date, company: company, resume: resume)
    end

    it "includes roles that started after the date" do
      role = make_role('started after', DateTime.new(2016, 1, 1), DateTime.new(2017, 1, 1))
      expect(Role.in_resume(resume).since(since_date)).to include(role)
    end

    it "includes roles that started on the date" do
      role = make_role('started on', since_date, DateTime.new(2017, 1, 1))
      expect(Role.in_resume(resume).since(since_date)).to include(role)
    end

    it "includes roles that started before the date and ran through it" do
      role = make_role('spanning', DateTime.new(2014, 1, 1), DateTime.new(2016, 1, 1))
      expect(Role.in_resume(resume).since(since_date)).to include(role)
    end

    it "includes roles that started before the date and are still current" do
      role = make_role('current', DateTime.new(2014, 1, 1), nil)
      expect(Role.in_resume(resume).since(since_date)).to include(role)
    end

    it "excludes roles that ended before the date" do
      role = make_role('ended before', DateTime.new(2013, 1, 1), DateTime.new(2015, 5, 31))
      expect(Role.in_resume(resume).since(since_date)).not_to include(role)
    end

    it "orders results by start date descending" do
      make_role('older', DateTime.new(2014, 1, 1), DateTime.new(2016, 1, 1))
      make_role('newer', DateTime.new(2016, 1, 1), DateTime.new(2017, 1, 1))
      dates = Role.in_resume(resume).since(since_date).map(&:start_date)
      expect(dates).to eq(dates.sort.reverse)
    end
  end
end
