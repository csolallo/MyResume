###Development Notes###

The app has a dependency on the uuidgen utility that is not installed by default on debian. It can be installed using apt-get:
`apt-get install uuid-runtime`

####Database####

Database is now hosted on and managed by ClearDB. I'm now using Heroku.
  
It is not possible to shell into the slug and run apt-get. Therefore, it is **not** possible to run migrations and seeds from the slug. 
  
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

I have had trouble seeding the test db. A workaround is to temporarily set the database using:
`bin/rails db:environment:set RAILS_ENV=test`

Then,
`bin/rails rake db:seed`

#####Web Server#####

It may be that the bin folder is missing. This can be true after a clone. To recreate, use the following:
`rake rails:update:bin`

I am using Puma as it is installed by default when creating a new Rails app. To access the instance running in the Vagrant VM, start as follows:
`bundle exec puma`

#####Debugging locally#####

I debug using rdebug-ide and vscode. The commandline to initiate an rdebug-ide session is:  
`bundle exec rdebug-ide --debug --host 0.0.0.0 --port 1234 -- bin/rails s -p 3001 -b 0.0.0.0`

[Debugging Recipes from Microsoft](https://github.com/microsoft/vscode-recipes/tree/master/debugging-Ruby-on-Rails)

#####Deployment#####

In the app
* make sure the environment variables are set up

[git push helper](https://help.github.com/articles/pushing-to-a-remote/)

`git push heroku rails-5.0:master`

