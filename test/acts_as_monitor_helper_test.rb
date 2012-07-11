require 'test_helper'

class ActsAsMonitorHelperTest < ActionView::TestCase
#   test "monitor_tag return image" do
#     @test_class = TestClass.new
#     @image = image_tag("acts_as_monitor_#{@test_class.status_flag.to_s}.png" , :alt => "Click to view details")
#     assert monitor_tag(@test_class) == @image , "fail monitor tag :#{monitor_tag(TestClass.new)}"
#   end
  
  test "monitor_tag Rise exception" do
    assert_raise ActsAsMonitor::MissingMethod do
      monitor_tag(TestClassNoMonitor.new)
    end
  end
end

