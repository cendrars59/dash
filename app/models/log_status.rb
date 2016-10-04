# == Schema Information
#
# Table name: log_statuses
#
#  id          :integer          not null, primary key
#  code        :string
#  label       :string
#  description :text
#  active      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class LogStatus < ApplicationRecord

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

  # BR-LOGSTATUS-001 : Scope on open status when creating a new log.
  # It is the only status available.
  scope :open, -> {
    where(code: "OPE")
  }

end
