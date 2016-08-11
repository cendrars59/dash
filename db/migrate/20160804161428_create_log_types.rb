class CreateLogTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :log_types do |t|
      t.string :code
      t.string :label
      t.text :description
      t.boolean :active

      t.timestamps
    end
  end
end
