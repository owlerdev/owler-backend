## README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

### Ruby version 
2.1.5

### Configuration
Install rvm (ruby version manager)
Install ruby
`rvm install ruby-2.1.5`
Run `bundle install`  

##Heroku setup
Install the heroku commandline toolbelt

* Database creation
Install Postgresql on your operating system
For Macs, use you can use homebrew if you have it:
`brew install postgresql`
Run Postgres, on OSX with El Capitan:
`launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist`

After Postgres is installed and running:
Create user as a superuser:
`createuser -s viewthespace`
Create the databases for development and testing:
`createdb -O viewthespace -E utf8 owler_development`
`createdb -O viewthespace -E utf8 owler_test`
*On Linux, if you run into an authentication problem with Postgres, you may have to do this: http://stackoverflow.com/questions/5817301/rake-dbcreate-fails-authentication-problem-with-postgresql-8-4
*(Mac) If postgres is running, but you see an error like could not connect to server: No such file or directory, try creating a symlink:
cd var && ln -s /tmp pgsql_socket

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
