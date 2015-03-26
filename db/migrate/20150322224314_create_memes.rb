class CreateMemes < ActiveRecord::Migration
  def change
    create_table :memes do |t|
      t.belongs_to :topic,index:true
      t.string "title",:null => false
      t.integer "likes",:default => 0
      t.integer "dislikes",:default =>0
      t.string "src",:null => false
      t.timestamps
    end
  end
end
