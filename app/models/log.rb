class Log < ApplicationRecord

#############################################################################
# Data  model relationships
#############################################################################

  belongs_to :log_stage
  belongs_to :log_status
  belongs_to :log_added_value
  belongs_to :log_type
  belongs_to :milestone

#############################################################################
# Log business rules and controls
#############################################################################


########### When creating or updating log

  before_create :set_code


  private

  def set_code
    self.code = self.log_type.code +(1..9999).to_a.shuffle.to_s.rjust(4,'0')
  end



end
