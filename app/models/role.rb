require 'sinatra'
require 'sinatra/activerecord'

module Resume
  module Models
    class Role < ActiveRecord::Base
      belongs_to :company
      has_and_belongs_to_many :resume
      has_many :projects
      has_many :accomplishments, as: :associated
      
      def self.find_roles_by_resume_since(resume, start)
        results = find_by_sql(['select r.* from roles r where r.resume_id = ? and r.start_date >= ? order by start_date desc', resume, start])
        if results.count > 0
          return results
        end
        
        raise ActiveRecord::RecordNotFound, "Couldn't find Resume::Models::Role with 'resume_id'=#{resume} and 'start_date'>=#{start}"
      end
    end
  end
end
