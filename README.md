# SendgridEvents

SendgridEvents is a gem designed to give your application [Sendgrid postbacks](http://docs.sendgrid.com/documentation/api/event-api/008c8d3732b6b8b496362fefa86e4deca0af99b9ed0a7f89fa2004a78f00dd2b325f17be5ccb4a19e4f95091b329bb2b78cabea8689a78f111b26c5296a87dd2fb).
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
