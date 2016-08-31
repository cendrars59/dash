class ChangeExpectationFormatInLogs < ActiveRecord::Migration[5.0]
  def change
    change_column :logs, :expectation, :text
  end
end
