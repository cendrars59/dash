# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  comment    :text
#  log_id     :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_comments_on_log_id   (log_id)
#  index_comments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_03de2dc08c  (user_id => users.id)
#  fk_rails_6c6ac5a6a1  (log_id => logs.id)
#

class Comment < ApplicationRecord

#############################################################################
# Data  model relationships
#############################################################################
  belongs_to :log
  belongs_to :user


end
