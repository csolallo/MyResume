require 'sinatra'

module Resume
  module Routes
    class Resume < Base
      def find_resume_by_id(resume)
        begin
          return Models::Resume.find(resume)
        rescue ActiveRecord::RecordNotFound
          raise ResumeNotFound
        end
      end
      
      get '/resumes/:resume/jobs' do |resume|
        r = self.find_resume_by_id(resume)
        
        since = params[:since]
        if !since.nil?
          begin
            jobs = Models::Role.find_roles_by_resume_since(r.id, since.to_date)
          rescue
            raise ResumeNotFound
          end
        else
          jobs = r.jobs
          if jobs.count == 0
            raise ResumeNotFound
          end
        end
        
        result = {
          :companies => [],
          :jobs => []
        }
        
        jobs.each do |job|
          # companies
          index = result[:companies].find_index {|company| company.id == job.company_id}
          if index.nil?
            result[:companies] << job.company
          end
          
          # jobs
          job_json = job.to_json :include => {:projects => {:include => [{:accomplishments => {:except => [:id, :associated_id, :associated_type]}}, :tags, {:apps => {:except => [:id, :project_id]}}], :except => [:role_id, :id]}}, :except => [:id, :resume_id]
          tmpJob = ActiveSupport::JSON.decode(job_json)
          tmpJob['projects'].each {|p| unless p['apps'].length > 0; p.delete('apps'); end }
          result[:jobs] << tmpJob
        end
        
        content_type 'application/json'
        response.headers['Access-Control-Allow-Origin'] = '*'
        result.to_json
      end
  
      get '/resumes/:resume/tags' do |resume|
        r = self.find_resume_by_id(resume)
        tags = Models::Tag.find_by_resume r
        
        content_type 'application/json'
        response.headers['Access-Control-Allow-Origin'] = '*'
        tags.to_json
      end
      
      get '/resumes/:resume/tags/:tags/jobs' do |resume, tags|
        r = self.find_resume_by_id(resume)
        projects = Models::Project.find_by_resume(r)
        tags = tags.split(',').map { |x| x.to_i }
        filtered_projects = []
        
        projects.each do |project|
          project_tags = project.tags.collect { |t| t.id }.uniq
          if (tags & project_tags).length > 0
            filtered_projects << project
          end
        end
        
        result = {
          :companies => [],
          :jobs => []
        }
        
        filtered_projects.each do |project|
          role = project.role

          #companies
          index = result[:companies].find_index { |company| company.id == role.company.id }
          if index.nil?
            result[:companies] << role.company
          end
          
          #jobs. note, we need to keep role.id so we can match projects for the same role
          index = result[:jobs].index { |ro| ro['id'] == role.id }
          if index.nil?
            r = ActiveSupport::JSON.decode role.to_json :except => [:resume_id]
            r[:projects] = []
            result[:jobs] << r
          else
            r = result[:jobs][index]
          end
          
          json_string = project.to_json :include => [{:accomplishments => {:except => [:id, :associated_id, :associated_type]}}, :tags, {:apps => {:except => [:id, :project_id]}}], :except => [:id, :role_id]
          tmpJob = ActiveSupport::JSON.decode(json_string)
          if tmpJob['apps'].length == 0
            tmpJob.delete('apps')
          end
          r[:projects] << tmpJob
        end

        if result[:jobs].length == 0
          raise JobNotFound
        end

        response.headers['Access-Control-Allow-Origin'] = '*'
        
        #remove the unneeded role.id now
        result[:jobs].each { |job| job.delete('id') }
        result.to_json       
      end
    end
  end
end