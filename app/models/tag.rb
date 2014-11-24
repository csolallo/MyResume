require 'sinatra'
require 'sinatra/activerecord'

module Resume
  module Models
    class Tag < ActiveRecord::Base
      has_and_belongs_to_many :projects
      
      def self.find_by_resume(resume)
        puts resume.class
        
        if resume.is_a? Resume
          resume_id = resume.id
        elsif resume.is_a? Fixnum
          resume_id = resume
        else
          resume_id = -1
        end
        
        query = <<-qry
          select distinct t.* 
          from tags t
          join projects_tags pt on pt.tag_id = t.id
          join projects p on p.id = pt.project_id
          join roles ro on ro.id = p.role_id
          join resumes r on r.id = ro.resume_id
          where r.id = ?
qry
        find_by_sql([query, resume_id])
      end
    end
  end
end