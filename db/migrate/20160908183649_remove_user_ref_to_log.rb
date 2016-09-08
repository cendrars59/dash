class RemoveUserRefToLog < ActiveRecord::Migration[5.0]
  def change
    remove_reference(:logs, :user, index: true)
  end
end
