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
# Log business rules and validation
#############################################################################


##################### Business rules #######################################

  # BR-LOGS-001 : If controls are valid then generate the code according the
  # following statement
  # code = log_type.code + random number between 1 and 9999
  # the random number has to be in format NNNN (4 digits)
  # IE : CR0001

  #before_create :set_code






####################### validation ##########################################

######## Validation on log code

  # CTRL-LOGS-001 : The code is mandatory



  # CTRL-LOGS-002 : The code is unique



######## Validation on log label

  # CTRL-LOGS-0xx : The title is mandatory



######## Validation on log description

  # CTRL-LOGS-0xx : The description is mandatory
















private

  def set_code
    self.code = self.log_type.code +(1..9999).to_a.shuffle.to_s.rjust(4,'0')
  end



end
