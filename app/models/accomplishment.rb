require 'sinatra'
require 'sinatra/activerecord'

module Resume
  module Models
    class Accomplishment < ActiveRecord::Base
      belongs_to :associated, polymorphic: true
    end
  end
end