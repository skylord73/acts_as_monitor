require 'test/unit'
require 'active_record'
require 'action_controller'
require 'action_controller/test_case'
require 'action_view/test_case'
require 'acts_as_monitor'

config = YAML::load(IO.read(File.dirname(__FILE__) + '/database.yml'))
ActiveRecord::Base.establish_connection(config['sqlite3'])

ActiveRecord::Schema.define(:version => 0) do
    begin
    drop_table :test_classes, :force => true
    rescue
      #dont really care if the tables are not dropped
    end

    create_table(:test_classes, :force => true) do |t|
      t.string :name
    end

  end
  
class TestClassNoMonitor 
end

class TestClass < ActiveRecord::Base
  acts_as_monitor
  attr_accessor :warn, :error
  
  after_initialize do
      @warn = false
      @error = false
  end
  
  
  private
  
  def warn_test?
    @warn
  end
  
  def error_test?
    @error
  end
  
end