class AltercolumnData < ActiveRecord::Migration
  def change
  	change_column :memes, :data_entry_id,:string
  end
end
