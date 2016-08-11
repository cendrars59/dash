class CreateLogStages < ActiveRecord::Migration[5.0]
  def change
    create_table :log_stages do |t|
      t.string :code
      t.string :label
      t.text :description
      t.boolean :active

      t.timestamps
    end
  end
end
