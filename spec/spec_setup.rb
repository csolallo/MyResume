# values to validate and/or set up tests
RSpec.configure do |config|
  config.add_setting :invalid_id
  config.invalid_id = 9999

  config.add_setting :valid_person_id
  config.valid_person_id = 1
  
  config.add_setting :valid_resume_id
  config.valid_resume_id = 1
  
  config.add_setting :last_job_start_date
  config.last_job_start_date = '8/1/2014'
  
  config.add_setting :info
  config.info = {
    :uuid => '048F0752-37BF-4D0E-ADFD-28BAF1E270FD',
    :name => 'Carlos Sola-Llonch'
  }
  
  config.add_setting :education
  config.education = {
    :origin => 'Florida International University',
    :year => 1991
  }
end