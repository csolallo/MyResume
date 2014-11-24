require 'sinatra'
require 'sinatra/activerecord'

module Resume
  module Models
    class App < ActiveRecord::Base
      belongs_to :project
    end
  end
end
