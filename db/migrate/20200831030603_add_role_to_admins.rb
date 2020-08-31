class AddRoleToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_reference :admins, :role, foreign_key: true
  end
end
