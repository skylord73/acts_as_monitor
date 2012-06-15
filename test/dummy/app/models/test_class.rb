class TestClass < ActiveRecord::Base
  acts_as_monitor
  attr_accessor :warn, :error
  
  after_initialize do
    @warn ||= false
    @error ||= false
  end
  
  
  private
  
  def warn_test?
    @warn
  end
  
  def error_test?
    @error
  end

  def warn_paperino?
    return true if self.name == 'Paperino'
  end

  def error_pippo?
    return true if self.name == 'Pippo'
  end

  def error_id?
    return true if self.id == 1
  end
  
end
