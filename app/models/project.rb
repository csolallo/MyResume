require 'sinatra'
require 'sinatra/activerecord'

module Resume
  module Models
    class Project < ActiveRecord::Base
      belongs_to :role
      has_many :accomplishments, as: :associated
      has_and_belongs_to_many :tags
      has_many :apps
      
      def self.find_by_resume(resume)
        if resume.is_a? Fixnum
          resume_id = resume
        elsif resume.is_a? Resume
          resume_id = resume.id
        else
          resume_id = -1
        end
        
        query = <<-qry
          select distinct p.* 
          from projects p
          join roles ro on ro.id = p.role_id
          join resumes r on r.id = ro.resume_id
          where r.id = ?
qry
        find_by_sql([query, resume_id])
      end
    end
  end
end