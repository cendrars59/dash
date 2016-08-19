class AddMilestoneToLogs < ActiveRecord::Migration[5.0]
  def change
    add_reference :logs, :milestone, foreign_key: true
  end
end
