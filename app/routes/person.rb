require 'sinatra'

module Resume
  module Routes
    class Person < Base
      def find_person_by_uuid(uuid)
        person = Models::Person.find_by_uuid(uuid)
        if person.nil?
          raise PersonNotFound
        end
        
        person
      end
      
      get '/people/:uuid/info' do |uuid|
        person = self.find_person_by_uuid(uuid)
        hash = {:name => person.name}
        unless person.address1.nil?; hash[:address1] = person.address1; end
        unless person.address2.nil?; hash[:address2] = person.address2; end
        unless person.city.nil?; hash[:city] = person.city; end
        unless person.state.nil?; hash[:state] = person.state; end
        unless person.zip.nil?; hash[:zip] = person.zip; end
        unless person.number.nil?; hash[:phone] = person.number; end
        unless person.email.nil?; hash[:email] = person.email; end
        
        content_type 'application/json'
        hash.to_json
      end
    
      get '/people/:uuid/education' do |uuid|
        person = self.find_person_by_uuid(uuid)
        certs = []
        person.certificates.each do |cert|
          certificate = {
            :origin => cert.origin,
            :title  => cert.title
          }
          unless cert.gpa.nil?; certificate[:gpa] = cert.gpa; end
          unless cert.year.nil?; certificate[:year] = cert.year; end
          
          certs << certificate
        end
        
        content_type 'application/json'
        certs.to_json
      end
      
      get '/people/:uuid/highlights' do |uuid|
        person = self.find_person_by_uuid(uuid)
        highlights = []
        person.highlights.each { |highlight| highlights << highlight.description }
        
        highlights.to_json
      end
      
      get '/people/:uuid/resume' do |uuid|
        person = self.find_person_by_uuid(uuid)
        resume = Models::Resume.find_by_person(person)
        hash = {:resume => resume.id}
        
        content_type 'application/json'
        hash.to_json
      end
    end
  end
end