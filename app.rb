require 'rubygems'
require 'bundler'

require_relative 'config/environments'
require_relative 'app/models'
require_relative 'app/routes'

Bundler.require

#$: << File.expand_path('../', __FILE__)

module Resume
  class App < Sinatra::Application
    configure do
      enable :static
    end
    
    use Rack::Deflater

    use Resume::Routes::Person
    use Resume::Routes::Resume
  end
end

# access models in the console
include Resume::Models
