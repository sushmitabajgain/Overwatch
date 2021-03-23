class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :project
      t.string :project_health
      t.string :project_timeline
      t.string :workload
      t.integer :pending_raid
      t.text :milestone_status
      t.text :notes

      t.timestamps
    end
  end
end
