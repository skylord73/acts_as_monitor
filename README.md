# ActsAsMonitor

Provide a way to monitor the status of a model.
The health of the model is checked by private method, defined by user

## Installation

Add this line to your application's Gemfile:

    gem 'acts_as_monitor'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install acts_as_monitor
    
Copy icons and other files

    rails g acts_as_monitor:install

## Usage
    #app/models/user.rb
    class User < ActiveRecord::Base
      acts_as_monitor
    
      ... your code ...
    
      private
    
      def warn_stange?
        ... do some checks and return true or false
        true
      end
    
      def warn_not_now?
        ... do some checks and return true or false
        false
      end
    
      def error_terrible?
        ... do some checks and return true or false
        true
      end
    end

You can now check the status of your model using the following code:
    @user = User.new
    
    @user.status
    > {:warn => [:warn_strange?], :error => [:error_terrible?]}
    
    @user.status_flag
    > :red
    
You can query the status of youe model with:

    User.status_flag_equals(:red)   #=> Array of users with :red status
    
    User.status_flag_not_equals(:red) #=> Array of users with status not equlas to :red

You can use the monitor_tag helper to view a red/green/yellow rapresentation:

    #app/views/users/index.html.erb
    <%= monitor_tag_js %>     #Creates hidden div and load css and javascript
    ...
    <%= monitor_tag(@user) %>

Clicking the icon you'll receive via Ajax the full error/warning list

## Internationalization
You can localize the output modifing the acts_as_monitor.it.yml, or cloning for the language you prefear.
Name of models is retrived via human_name, so yuo have to localize the ActiveRecord to change names:
    it:
      activerecord:
        models:
          your_model_name: Your Model Name
          
          namespace:
            namespaced_model_name: Your Namespaced Model Name

## Personalization
Feel free to modify the fololwing files to change layouts and text :
- public/stylesheets/acts_as_monitor.css
- config/locales/act_as_monitor.it.yml

If you need a deeper personalization you can try to overload app/views/acts_as_monitor/monitors/show.html.erb
conaining the page template for the error/warning list

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
