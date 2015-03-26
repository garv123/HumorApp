class AddColumnToMeme < ActiveRecord::Migration
  def change
  	add_column(Meme,"data_entry_id","integer",:null => false)
  end
end
