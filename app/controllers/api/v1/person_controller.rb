module Api::V1
  class PersonController < ApplicationController
    before_action :get_person

    rescue_from Exceptions::PersonNotFound, Exceptions::ResumeNotFound do
      render nothing: true, status: 404
    end

    def info
      hash = {:name => @person.name}
      unless @person.address1.nil?; hash[:address1] = @person.address1; end
      unless @person.address2.nil?; hash[:address2] = @person.address2; end
      unless @person.city.nil?; hash[:city] = @person.city; end
      unless @person.state.nil?; hash[:state] = @person.state; end
      unless @person.zip.nil?; hash[:zip] = @person.zip; end
      unless @person.number.nil?; hash[:phone] = @person.number; end
      unless @person.email.nil?; hash[:email] = @person.email; end

      send_response hash
    end

    def education
      certs = []
      @person.certificates.each do |cert|
        certificate = {
            :origin => cert.origin,
            :title  => cert.title
        }
        unless cert.gpa.nil?; certificate[:gpa] = cert.gpa; end
        unless cert.year.nil?; certificate[:year] = cert.year; end

        certs << certificate
      end

      send_response certs
    end

    def highlights
      highlights = []
      @person.highlights.each { |highlight| highlights << highlight.description }

      send_response highlights
    end

    def resume
      get_resume
      hash = {:resume => @resume.id}

      send_response hash
    end

    private

    def get_person
      @person = Person.find_by_uuid params[:uuid]
      raise Exceptions::PersonNotFound if @person.nil?
    end

    def get_resume
      @resume = Resume.for_person(@person).first
      raise Exceptions::ResumeNotFound if @resume.nil?
    end
  end
end
