require 'sinatra'
require 'sinatra/activerecord'

module Resume
  module Models
    autoload :Resume,         './app/models/resume'
    autoload :Person,         './app/models/person'
    autoload :Certificate,    './app/models/certificate'
    autoload :Company,        './app/models/company'
    autoload :Role,           './app/models/role'
    autoload :Project,        './app/models/project'
    autoload :Accomplishment, './app/models/accomplishment'
    autoload :Tag,            './app/models/tag'
    autoload :App,            './app/models/app'
  end
end
