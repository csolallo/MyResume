###Development Notes###

####Vagrant####

We are using the following base box:  

(Debian Jessie 8.0 RC2 64-bit Mininimal, Shrinked + Guest Additions 4.3.24 + Puppet 3.7.2)[http://static.gender-api.com/debian-8-jessie-rc2-x64-slim.box]

The following ports should be forwarded:  

|Port | Service|
|-----|--------|
|3306 | Mysql  |
|3000 | Sinatra|

####Database####

We are using Mysql 5.5.x. Because we are running in a VM, we need to ensure our dev user has full access:  

    create user 'ResumeDbUser'@'10.0.2.2' identified by 'yourpassword';  
    grant all privileges on *.* to 'ResumeDbUser'@'10.0.2.2' with grant option;  
    flush privileges;

Also, make sure the bind address is set properly in /etc/mysql/my.conf  

    bind-address = 0.0.0.0
    
In order to build the mysql2 gem, we need the dev packages for mysql and ruby. On our Debian VM, we issue the following:  

    apt-get install libmysqlclient-dev ruby-dev
    gem install mysql

Make sure utf8 is the default character set for the databse. Before creating the database, make sure you update /etc/mysql/my.conf as follows:  

    [mysqld]
    ...
    character-set-server=utf8 
    collation-server=utf8_unicode_ci 
    ...
    
####Sinatra####

Dev server (WEBrick) is started using rack:  

    rackup -p 3000


Alternatively, we can use the Thin web server:  

    rackup -p 3000 -s thin
    
