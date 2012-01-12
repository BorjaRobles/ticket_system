class Changemodelnames < ActiveRecord::Migration
  def change
    rename_table :comentarios, :comments
  end  
end
