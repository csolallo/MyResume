module Errors
  class PersonNotFound < ActiveRecord::RecordNotFound; end

  class ResumeNotFound < ActiveRecord::RecordNotFound; end

  class JobsNotFound < ActiveRecord::RecordNotFound; end

  class ProjectsNotFound < ActiveRecord::RecordNotFound; end

  class TagsNotFound < ActiveRecord::RecordNotFound; end
end
