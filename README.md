# ActsAsMonitor

Provide a way to monitor the status of a model
then health of the model is checked by private method, defined by user

## Installation

Add this line to your application's Gemfile:

    gem 'acts_as_monitor'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install acts_as_monitor

## Usage

[app/models/user.rb]
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

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
