# SendgridEvents

[![TravisCI](https://secure.travis-ci.org/jphenow/sendgrid_events.png "TravisCI")](http://travis-ci.org/jphenow/sendgrid_events "Travis-CI SendgridEvents")
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/jphenow/sendgrid_events)
[Ruby Gems](https://rubygems.org/gems/sendgrid_events)

SendgridEvents is a gem designed to give your application [Sendgrid postbacks](http://docs.sendgrid.com/documentation/api/event-api/).
With these postbacks you are more able to track the status of your emails programatically.

This gem creates a `SendgridEmailRecord` table for this tracking and you can attach handlers to specific
events.

# Installation

add

```ruby
gem 'sendgrid_events'
```

to your Gemfile and run

```
bundle install
```

After that you'll want to run:

```
rails g sendgrid_events:install
rake db:migrate
```

Finally, you'll want to edit your `config/initializers/sendgrid_events.rb`. Currently
you just have the option to include or disclude certain event handlers.

This project rocks and uses MIT-LICENSE.
