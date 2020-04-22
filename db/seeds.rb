if Person.count(:all) == 0
  require_relative 'person_seeds'
end

if Company.find_by_name('Requested').nil?
  require_relative 'requested_seeds'
end

if Company.find_by_name('Providence Health & Services').nil?
  require_relative 'providence_seeds'
  require_relative 'providence2_seeds'
end

if Company.find_by_name('HighPoint').nil?
  require_relative 'highpoint_seeds'
end

if Company.find_by_name('Starbucks').nil?
  require_relative 'starbucks_seeds'
end

if Company.find_by_name('Yorder').nil?
  require_relative 'yorder_seeds'
end

if Company.find_by_name('ALLDATA/Autozone').nil?
  require_relative 'alldata_seeds'
end

if Company.find_by_name('ISingleton, Inc.').nil?
  require_relative 'isingleton_seeds'
end

if Tag.count(:all) == 0
  require_relative 'tag_seeds'
end

if Resume.count(:all) == 0
  require_relative 'resume_seeds'
end
