# values to validate and/or set up tests
RSpec.configure do |config|
  config.add_setting :invalid_id
  config.invalid_id = 9999

  config.add_setting :valid_person_id
  config.valid_person_id = 1
  
  config.add_setting :valid_resume_id
  config.valid_resume_id = 1

  config.add_setting :valid_job_id
  config.valid_job_id = 2

  # a project that can be used to test accomplishments, tags, apps, etc. 
  config.add_setting :valid_project_id
  config.valid_project_id = 3
  
  config.add_setting :valid_tag_id
  config.valid_tag_id = 1
  
  config.add_setting :valid_tag_array
  config.valid_tag_array = "1,4"
  
  config.add_setting :last_job_start_date
  config.last_job_start_date = '4/1/2015'
  
  config.add_setting :info
  config.info = {
    :uuid => '30C6C5EB-533A-41C7-9162-2B00F0EB9305',
    :name => 'Carlos Sola-Llonch'
  }
  
  config.add_setting :education
  config.education = {
    :origin => 'Florida International University',
    :year => 1991
  }
end