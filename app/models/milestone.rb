# == Schema Information
#
# Table name: milestones
#
#  id          :integer          not null, primary key
#  code        :string
#  label       :string
#  description :text
#  active      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Milestone < ApplicationRecord

#############################################################################
# Data  model relationships
#############################################################################
  has_many :logs_milestones_proposal, class_name: 'Log', foreign_key: 'expected_milestone_id'
  has_many :logs_milestones_commit, class_name: 'Log', foreign_key: 'confirmed_milestone_id'

#############################################################################
# Scope on set data`
#############################################################################

  # Scope on the active item
  scope :active, -> {
    where(active: true)
  }

end
