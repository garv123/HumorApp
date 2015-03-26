class DropCol < ActiveRecord::Migration
  def change
  	remove_column :topics, :src
  end
end
