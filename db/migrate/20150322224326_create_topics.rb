class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string "topic_name", :limit => 100,:null => false
      t.string "src",:null => false
      t.string "alt", :null => true
      t.timestamps
    end
  end
end
