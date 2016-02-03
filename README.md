## README

### Ruby version 
2.1.5

### Configuration
Install rvm (ruby version manager)
Install ruby
`rvm install ruby-2.1.5`
Run `bundle install`  

### Database creation
Install Postgresql on your operating system
For Macs, use you can use homebrew if you have it:
`brew install postgresql`
Now run postgres. My personal favorite way of doing this is on Mac is with the `lunchy` gem.
`gem install lunchy`
and then
`lunchy start postgres` or `lunchy stop postgres`

After Postgres is installed and running:
Create user as a superuser:
`createuser -s -r owler`
Create the databases for development and testing:
`rake db:create:all`
This creates three databases, one for development, testing, and production. Details in `database.yml`
Then migrate your databases. You'll be doing this often, so it might be a good idea to make an alias for these two commands so that you always run them at the same time.
`rake db:migrate` and `rake db:migrate RAILS_ENV=test`

### Heroku setup
Install the heroku commandline toolbelt

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
