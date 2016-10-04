# == Schema Information
#
# Table name: log_screens
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class LogScreen < ApplicationRecord





#############################################################################
# Data  model relationships
#############################################################################

  belongs_to :log



end
