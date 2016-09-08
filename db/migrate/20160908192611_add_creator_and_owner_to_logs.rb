class AddCreatorAndOwnerToLogs < ActiveRecord::Migration[5.0]
  def change

      add_column :logs, :creator_id, :integer
      add_column :logs, :owner_id, :integer

  end
end
