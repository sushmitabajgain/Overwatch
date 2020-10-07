class CreateMilestones < ActiveRecord::Migration[6.0]
  def change
    create_table :milestones do |t|
      t.string :project
      t.integer :no_of_milestones
      t.integer :missed_milestones
      t.integer :completed_milestones
      
      t.timestamps
    end
  end
end
