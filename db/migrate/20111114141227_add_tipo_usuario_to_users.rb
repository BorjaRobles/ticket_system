class AddTipoUsuarioToUsers < ActiveRecord::Migration
  def change
    add_column :users, :soporte, :boolean, default:false
  end
end
