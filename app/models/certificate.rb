require 'sinatra'
require 'sinatra/activerecord'

module Resume
  module Models
    class Certificate < ActiveRecord::Base
      belongs_to :person
    end
  end
end
