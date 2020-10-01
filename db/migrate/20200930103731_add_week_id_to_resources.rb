class AddWeekIdToResources < ActiveRecord::Migration[6.0]
  def change
    add_reference :resources, :week, foreign_key: true
  end
end