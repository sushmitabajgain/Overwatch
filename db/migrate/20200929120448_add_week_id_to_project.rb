class AddWeekIdToProject < ActiveRecord::Migration[6.0]
  def change
    add_reference :projects, :week, foreign_key: true
  end
end