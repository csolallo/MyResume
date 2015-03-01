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
      set :root, File.dirname(__FILE__)
      set :public_folder, Proc.new { File.join(root, "public") }
    end
    
    use Rack::Deflater

    use Resume::Routes::Person
    use Resume::Routes::Resume
    
    puts settings.public_folder
    
    get '/help' do
      send_file File.join(settings.public_folder, 'help.html')
    end
  end
end

# access models in the console
include Resume::Models
