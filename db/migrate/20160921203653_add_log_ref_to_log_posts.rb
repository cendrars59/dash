class AddLogRefToLogPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :log_posts, :log, foreign_key: true
  end
end
