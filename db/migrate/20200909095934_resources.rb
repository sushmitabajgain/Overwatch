class Resources < ActiveRecord::Migration[6.0]
  def change
    create_table :resources do |t|
      t.integer :multiple
      t.string :name
      t.timestamps
    end
  end
end
