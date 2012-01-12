class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.string :autor
      t.text :texto
      t.references :ticket
      t.references :user

      t.timestamps
    end
    add_index :comentarios, :ticket_id
    add_index :comentarios, :user_id
  end
end
