require 'test_helper'

class ActsAsMonitorTest < ActiveSupport::TestCase
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
    assert @test_class.status == {:warn => [:warn_test ], :error => []} , "Error: #{@test_class.status.inspect}"
    assert @test_class.status_flag == :yellow , "Error: #{@test_class.status_flag.inspect}"
  end
  
  test "Status error" do
    @test_class = TestClass.new(:error => true)
    assert @test_class.status == {:warn => [], :error => [:error_test ]}, "Error: #{@test_class.status.inspect}"
    assert @test_class.status_flag == :red , "Error: #{@test_class.status_flag.inspect}"
  end
  
  test "Status error & warn " do
    @test_class = TestClass.new(:error => true, :warn => true)
    assert @test_class.status == {:warn => [:warn_test ], :error => [:error_test ]}, "Error: #{@test_class.status.inspect}"
    assert @test_class.status_flag == :red , "Error: #{@test_class.status_flag.inspect}"
  end
  
  test "Status_equals " do
    TestClass.delete_all
    TestClass.create(:name => :red)
    TestClass.create(:name => :green)
    TestClass.create(:name => :yellow)
    assert_equal "green",  TestClass.status_flag_equals(:green).first.name, "Error: green"
    assert_equal "red",  TestClass.status_flag_equals(:red).first.name, "Error: green"
    assert_equal "yellow",  TestClass.status_flag_equals(:yellow).first.name, "Error: green"
  end
  
  test "Status_not_equals " do
    TestClass.delete_all
    TestClass.create(:name => :red)
    TestClass.create(:name => :green)
    TestClass.create(:name => :yellow)
    assert_equal "green",  TestClass.status_flag_not_equals(:green).first.name, "Error: green #{TestClass.status_flag_not_equals(:green)}"
    assert_equal "red",  TestClass.status_flag_not_equals(:red).first.name, "Error: green"
    assert_equal "yellow",  TestClass.status_flag_not_equals(:yellow).first.name, "Error: green"
  end
  
end
