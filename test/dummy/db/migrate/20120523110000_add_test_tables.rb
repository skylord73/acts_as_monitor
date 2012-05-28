class AddTestTables <  ActiveRecord::Migration
  def self.up
   create_table(:test_classes, :force => true) do |t|
      t.string :name
   end
  end

  def self.down
  end

end
 
