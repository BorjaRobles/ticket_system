class AddEstadoToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :estado, :integer, :default => 0
  end
end
