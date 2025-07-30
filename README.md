###Development Notes###

The app has a dependency on the uuidgen utility that is not installed by default on debian. It can be installed using apt-get:
`apt-get install uuid-runtime`

####Database####
  
Run in dev machine using rake and the heroku command line:

```
heroku run rake db:migrate VERSION=0
heroku run rake db:migrate
heroku run rake db:seed
```

####Rails####
    
#####DB Config#####

I follow this strategy for cleansing the database.yml file:
* In `./scripts/source.sh`, I export the RDS_* environment variables
* I then make sure to run `source ./scripts/source.sh` before any Rails cli commands

#####Testing#####

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

#####Web Server#####

It may be that the bin folder is missing. This can be true after a clone. To recreate, use the following:
`rake rails:update:bin`

I am using Puma as it is installed by default when creating a new Rails app. To access the instance running in the Vagrant VM, start as follows:
`bundle exec puma`

#####Debugging locally#####

Outside of VSCode, I use the byebug gem. It is handy for debugging migrations and seeds. In VSCode, I use [the ruby debug gem](https://marketplace.visualstudio.com/items?itemName=castwide.ruby-debug)

#####Deployment#####

In the app
* make sure the environment variables are set up

[git push helper](https://help.github.com/articles/pushing-to-a-remote/)

`git push heroku rails-5.0:master`

