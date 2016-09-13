class AddExpectedMilestoneAndConfirmedMilestoneToLogs < ActiveRecord::Migration[5.0]
  def change
    add_column :logs, :expected_milestone_id, :integer
    add_column :logs, :confirmed_milestone_id, :integer
  end
end
