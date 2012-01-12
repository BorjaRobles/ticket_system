class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :titulo
      t.text :contenido
      t.string :tags
      t.references :user

      t.timestamps
    end
    add_index :tickets, :user_id
  end
end
