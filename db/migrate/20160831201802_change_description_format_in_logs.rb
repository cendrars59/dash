class ChangeDescriptionFormatInLogs < ActiveRecord::Migration[5.0]
  def change
    change_column :logs, :description, :text
  end
end
