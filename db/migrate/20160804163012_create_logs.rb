class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.string :code
      t.string :label
      t.text :description

      t.timestamps
    end
  end
end
