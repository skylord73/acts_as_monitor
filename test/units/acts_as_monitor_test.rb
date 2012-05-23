require 'test_helper'

class ActsAsMonitorTest < ActiveSupport::TestCase
  include ActionView::Helpers
  include ActsAsMonitor::Helper
  
  test "Methods exists!" do
    @test_class = TestClass.new
    assert TestClass.respond_to?(:acts_as_monitor), "acts_as_monitor missing!"
    assert @test_class.respond_to?(:status), "status missing!"
    assert @test_class.respond_to?(:status_flag), "status_flag missing!"
  end
  
  test "Status ok" do
    @test_class = TestClass.new()
    assert @test_class.status == {:warn => [], :error => []} , "Error: #{@test_class.status.inspect}"
    assert @test_class.status_flag == :green , "Error: #{@test_class.status_flag.inspect}"
  end
  
  test "Status warn" do
    @test_class = TestClass.new(:warn => true)
    assert @test_class.status == {:warn => [:warn_test? ], :error => []} , "Error: #{@test_class.status.inspect}"
    assert @test_class.status_flag == :yellow , "Error: #{@test_class.status_flag.inspect}"
  end
  
  test "Status error" do
    @test_class = TestClass.new(:error => true)
    assert @test_class.status == {:warn => [], :error => [:error_test? ]}, "Error: #{@test_class.status.inspect}"
    assert @test_class.status_flag == :red , "Error: #{@test_class.status_flag.inspect}"
  end
  
  test "Status error & warn " do
    @test_class = TestClass.new(:error => true, :warn => true)
    assert @test_class.status == {:warn => [:warn_test? ], :error => [:error_test? ]}, "Error: #{@test_class.status.inspect}"
    assert @test_class.status_flag == :red , "Error: #{@test_class.status_flag.inspect}"
  end
  
  test "monitor_tag exists" do
    assert monitor_tag(TestClass.new) == "" , "fail monitor tag :#{monitor_tag(TestClass.new)}"
  end
  
  
end
