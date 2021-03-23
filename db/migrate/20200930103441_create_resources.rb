class CreateResources < ActiveRecord::Migration[6.0]
  def change
    create_table :resources do |t|
      t.string :project
      t.string :no_of_resources
      
      t.timestamps
    end
  end
end
