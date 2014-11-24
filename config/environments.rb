require 'sinatra'
require 'sinatra/activerecord'

#The environment variable DATABASE_URL should be in the following format:
# => mysql2://{user}:{password}@{host}:{port}/path
configure :production, :development do
  db = URI.parse(ENV['DATABASE_URL'] || "mysql2://#{ENV['RDS_USERNAME']}:#{ENV['RDS_PASSWORD']}@#{ENV['RDS_HOSTNAME']}:#{ENV['RDS_PORT']}/#{ENV['RDS_DB_NAME']}")
 
  ActiveRecord::Base.establish_connection(
    :adapter => db.scheme,
    :host    => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
    )
end
