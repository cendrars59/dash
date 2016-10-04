# == Schema Information
#
# Table name: log_stages
#
#  id          :integer          not null, primary key
#  code        :string
#  label       :string
#  description :text
#  active      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class LogStage < ApplicationRecord

#############################################################################
# Data  model relationships
#############################################################################
  has_many :logs


#############################################################################
# Scope on set data`
#############################################################################

  # Scope on the active item
  scope :active, -> {
    where(active: true)
  }

end
