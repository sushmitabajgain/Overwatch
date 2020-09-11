class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.integer :sn
      t.integer :week
      t.string :status
      t.string :project
      t.string :start_date
      t.string :end_date
      t.string :extended_date
      t.text :notes
      t.integer :no_of_resources
      t.string :no_of_milestone
      t.string :completed_milestone
      t.string :missed_milestone
    end
  end
end
