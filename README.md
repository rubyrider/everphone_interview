# EverPhone Interview
##Project Gift Finder

### About


### How to Setup

The following gems are required as necessary:


```textmate
Ruby Version: 3.0.1
Database: Postgresql
Postgresql Version: 12
```

Once you are done having the above requirements ready, please follow the next instruction:

To Install the gem dependencies:
* `bundle install`
  
To Setup the database and loading the default data:
* `bundle exec rake db:create`
* `bundle exec rake db:migrate`
* `bundle exec rake db:setup`

or 

* `bundle exec rake db:setup`

To Start the Server:

`bundle exec rails s`

***
