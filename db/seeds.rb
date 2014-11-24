if Resume::Models::Person.count(:all) == 0
  require_relative 'person_seeds'
end

if Resume::Models::Company.find_by_name('Providence Health & Services').nil?
  require_relative 'providence_seeds'
end

if Resume::Models::Company.find_by_name('HighPoint').nil?
  require_relative 'highpoint_seeds'
end

if Resume::Models::Company.find_by_name('Starbucks').nil?
  require_relative 'starbucks_seeds'
end

if Resume::Models::Company.find_by_name('Yorder').nil?
  require_relative 'yorder_seeds'
end

if Resume::Models::Company.find_by_name('ALLDATA/Autozone').nil?
  require_relative 'alldata_seeds'
end

if Resume::Models::Company.find_by_name('ALLDATA/Autozone').nil?
  require_relative 'alldata_seeds'
end

if Resume::Models::Company.find_by_name('ISingleton, Inc.').nil?
  require_relative 'isingleton_seeds'
end

if Resume::Models::Tag.count(:all) == 0
  require_relative 'tag_seeds'
end

if Resume::Models::Resume.count(:all) == 0
  require_relative 'resume_seeds'
end
