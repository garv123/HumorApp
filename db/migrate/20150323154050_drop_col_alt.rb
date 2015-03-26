class DropColAlt < ActiveRecord::Migration
  def change
  	remove_column :topics, :alt
  end
end
