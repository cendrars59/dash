class CreateLogPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :log_posts do |t|
      t.string :label
      t.text :description
      t.boolean :active
      t.timestamps
    end
  end
end
