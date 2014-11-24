require 'sinatra'
require 'sinatra/activerecord'

module Resume
  module Models
    class Company < ActiveRecord::Base
      has_many :roles
    end
  end
end
