class AddLogStatusRefToLogs < ActiveRecord::Migration[5.0]
  def change
    add_reference :logs, :log_status, foreign_key: true
  end
end
