class RemoveMilestoneRefToLogs < ActiveRecord::Migration[5.0]
  def change
    remove_reference(:logs, :milestone, index: true)
  end
end
