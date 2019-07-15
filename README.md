###Development Notes###

####Vagrant####

We are using the following base box:

[bento/debian-8.5](https://atlas.hashicorp.com/bento/boxes/debian-8.5)

The following ports should be forwarded:

|Port | Service|
|-----|--------|
|3306 | Mysql  |
|3000 | Rails  |

If using __Parallels__, install the [Vagrant Parallels plugin](https://github.com/Parallels/vagrant-parallels)

The app has a dependency on the uuidgen utility that is not installed by default on debian. It can be installed using apt-get:
`apt-get install uuid-runtime`

Misc. notes on vagrant:

Vagrant will sometimes not free port forwards on halt (known issue). To fix:

* remove all unused forwards in:
sudo vi /Library/Preferences/VMware\ Fusion/vmnet8/nat.conf

* restart vmnet-cli:
sudo /Applications/VMware\ Fusion.app/Contents/Library/vmnet-cli --stop
sudo /Applications/VMware\ Fusion.app/Contents/Library/vmnet-cli --start

####Database####

Datbase is now hosted on and managed by ClearDB. I'm now using Heroku.
  
####Rails####

If building Ruby from source:

Uninstall existing ruby package

Before building on debian:

    sudo apt-get install libssl-dev
    sudo apt-get install zlib1g-dev
    
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

#####Deployment#####

In the app
* make sure the environment variables are set up
* make sure you add the [buildpack](https://github.com/bundler/heroku-buildpack-bundler2.git) (bundle 2 needs help)

[git push helper](https://help.github.com/articles/pushing-to-a-remote/)

`git push heroku rails-5.0:master`

