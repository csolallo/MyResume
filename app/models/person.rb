require 'sinatra'
require 'sinatra/activerecord'

module Resume
  module Models
    class Person < ActiveRecord::Base
      has_one :resume
      has_many :certificates
      has_many :highlights, :class_name => 'Accomplishment', as: :associated
    end
  end
end
