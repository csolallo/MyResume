me = Person.first
resume = Resume.create(
  person: me
)

# all jobs are mine ...
Company.all.each do |company|
  company.roles.each { |role| resume.jobs << role }
end
