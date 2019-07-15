module Api::V1
  class ResumeController < ApplicationController
    before_action :get_resume

    rescue_from Exceptions::ResumeNotFound, Exceptions::JobsNotFound, Exceptions::TagsNotFound do
      render nothing: true, status: 404
    end

    def jobs
      since = params[:since]
      if !since.nil?
        since_date = DateTime.strptime since, '%m/%d/%Y'
        jobs = Role.in_resume(@resume).since(since_date)
        raise Exceptions::JobsNotFound unless jobs.count > 0
      else
        jobs = @resume.jobs
        raise Exceptions::JobsNotFound unless jobs.count > 0
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

      send_response result
    end

    def tags
      tags = Tag.in_resume @resume
      raise Exceptions::TagsNotFound if tags.count == 0

      send_response tags
    end

    def jobs_by_tags
      projects = Project.in_resume @resume
      raise Exceptions::ProjectsNotFound unless projects.count > 0

      tags = params[:tags].split(',').map { |x| x.to_i }
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
        role = project.job

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
        raise Exceptions::JobsNotFound
      end

      #remove the unneeded role.id now
      result[:jobs].each { |job| job.delete('id') }

      send_response result
    end

    private

    def get_resume
      @resume = Resume.find params[:id]
      raise Exceptions::ResumeNotFound if @resume.nil?
    end
  end
end
