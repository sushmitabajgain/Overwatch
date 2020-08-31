class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :project
      t.string :status
      t.text :start_closed_date
      t.text :milestone
      t.text :notes
    end
  end
end
