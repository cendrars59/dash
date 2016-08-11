class AddLogAddedValueRefToLogs < ActiveRecord::Migration[5.0]
  def change
    add_reference :logs, :log_added_value, foreign_key: true
  end
end
