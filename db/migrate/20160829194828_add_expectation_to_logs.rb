class AddExpectationToLogs < ActiveRecord::Migration[5.0]
  def change
    add_column :logs, :expectation, :binary
  end
end
