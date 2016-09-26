class AddUserRefToLogPosts < ActiveRecord::Migration[5.0]
  def change
  	add_reference :log_posts, :user, foreign_key: true
  end
end
