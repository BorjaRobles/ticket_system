class AddOwnerToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :owner, :string
  end
end
