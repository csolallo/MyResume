require 'sinatra'
require 'sinatra/activerecord'

module Resume
  module Models
    class Resume < ActiveRecord::Base
      belongs_to :person
      has_many :jobs, :class_name => 'Role'
      
      def self.find_by_person(person)
        if person.is_a?(Person)
          id = person.id
        elsif person.is_a?(Fixnum)
          id = person
        end
        
        unless id.nil?
          results = find_by_sql(['select r.* from resumes r where r.person_id = ?', id])
          unless results.count == 0
            return results.first
          end
        end  
        
        raise ActiveRecord::RecordNotFound, "Couldn't find Resume::Models::Resume with 'id'=#{person}"
      end
    end
  end
end
