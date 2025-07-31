### Development Notes ###

The app has a dependency on the uuidgen utility that is not installed by default on debian. It can be installed using apt-get:
`apt-get install uuid-runtime`

#### Database ####
  
Run in dev machine using rake and the heroku command line:

```
heroku run rake db:migrate VERSION=0
heroku run rake db:migrate
heroku run rake db:seed
```

#### Rails ####
    
##### DB Config #####

I follow this strategy for cleansing the database.yml file:
* In `./scripts/source.sh`, I export the RDS_* environment variables
* I then make sure to run `source ./scripts/source.sh` before any Rails cli commands

##### Testing #####

I am using RSpec for testing as I like its syntax.

Note -
Must install __rspec-rails__ gem for easy integration.

To generate spec environment in a rails app:  
`rails generate rspec:install`

To run spec tests:  
`bundle exec rspec`

Shortcut (available since rails 4):  
`bundle binstub rspec-core`

We can run our tests by issuing:  
`bin/rspec`

To reset the test db and also seed it you can:  
`bundle exec rails db:reset RAILS_ENV=test`

Alternatively, you can do each step individually:
```
bundle exec rails db:schema:load RAILS_ENV=test
bundle exec rails db:seed RAILS_ENV=test

or

bundle exec rails db:environment:set RAILS_ENV=test
bundle exec rails db:schema:load
bundle exec rails db:seed
```

##### Web Server #####

It may be that the bin folder is missing. This can be true after a clone. To recreate, use the following:  
`rake rails:update:bin`

##### Debugging locally #####

I use [the debug gem](https://github.com/ruby/debug?tab=readme-ov-file). 

I've added  __require "debug/open_nonstop"__ to the development config file so in VSCode if the "VSCode rdbg Ruby Debugger" is installed you can attach and debug in the IDE.

To debug the api using Thunder Client, it is not necessary to use a self-signed local host cert. So launch the web server as:  
`bundle exec rails s -b 0.0.0.0 -p 3001` 

To debug the graphql types, it *is* necessary to connect via https and so a self-signed certificate is necessary.  Follow the instructions for [the localhost gem](https://github.com/socketry/localhost?tab=readme-ov-file). Then launch the server as:  
`bundle exec rails s -b ssl://localhost:3001`

With the server started, we can use the [Apollo sandbox explorer](https://studio.apollographql.com/sandbox/explorer) (at least for now). The sanbox URL should be `https://localhost:3001/graphql`

Note, the api can also be debugged, but the host name must be __localhost__

##### Deployment #####

In the app
* make sure the environment variables are set up

[git push helper](https://help.github.com/articles/pushing-to-a-remote/)

`git push heroku rails-5.0:master`

