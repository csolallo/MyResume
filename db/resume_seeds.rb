me = Resume::Models::Person.first
resume = Resume::Models::Resume.create(
  person: me
)

# all jobs are mine ...
Resume::Models::Company.all.each do |company|
  company.roles.each { |role| resume.jobs << role }
end
