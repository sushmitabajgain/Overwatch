class AddWeekIdToMilestone < ActiveRecord::Migration[6.0]
  def change
    add_reference :milestones, :week, foreign_key: true
  end
end
