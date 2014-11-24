require 'sinatra'

module Resume
  module Routes
    class Base < Sinatra::Application
      configure do
        disable :static
        set :show_exceptions => false
      end
      
      error PersonNotFound do
        status 404
      end
      
      error ResumeNotFound do
        status 404
      end
      
      error JobNotFound do
        status 404
      end
    end
  end
end