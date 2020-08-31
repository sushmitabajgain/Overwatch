class AddImageToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :picture, :string
  end
end
