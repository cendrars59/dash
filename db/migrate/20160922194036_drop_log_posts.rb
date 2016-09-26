class DropLogPosts < ActiveRecord::Migration[5.0]
  def change
  	drop_table :log_posts
  end
end
