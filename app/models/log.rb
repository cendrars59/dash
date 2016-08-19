class Log < ApplicationRecord

#############################################################################
# Data  model relationships
#############################################################################

  belongs_to :log_stage
  belongs_to :log_status
  belongs_to :log_added_value
  belongs_to :log_type
  belongs_to :milestone

end
