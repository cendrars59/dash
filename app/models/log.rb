class Log < ApplicationRecord


#############################################################################
# log parameters
#############################################################################

@code_max_length = 7
@code_min_length = 6
@label_max_length = 40
@description_min_length = 10


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
  validates :code, presence: {presence: true, message: "CTRL-LOGS-001 : The code is mandatory"}

  # CTRL-LOGS-002 : The code is unique
  validates :code, uniqueness: {uniqueness: true, message: "CTRL-LOGS-002 : Code already existing, the code must be unique"}

  # CTRL-LOGS-003 : The code length can not exceed the max length
  validates :code, length: {maximum: @code_max_length, message: "CTRL-LOGS-003 : The code length can not exceed #{@code_max_length} caracters" }

  # CTRL-LOGS-004 : The code length can not below the minimum length
  validates :code, length: {minimum: @code_min_length, message: "CTRL-LOGS-004 : The code length can not be below #{@code_min_length} caracters" }


######## Validation on log label

  # CTRL-LOGS-005 : The title is mandatory
  validates :label, presence: {presence: true, message: "CTRL-LOGS-005 : The log title can not be blank "}

  # CTRL-LOGS-006 : The title can not execeed max length
  validates :label, length: {maximum: @label_max_length, message: "CTRL-LOGS-006 : The code length can not exceed #{@label_max_length} caracters" }


######## Validation on log description

  # CTRL-LOGS-007 : The description is mandatory
  validates :description, length: {minimum: @description_min_length, message: "CTRL-LOGS-007 : The description length can not be below #{@description_min_length} caracters" }


######## Validation on log type

  # CTRL-LOGS-0xx : The log type is mandatory
  validates :log_type, presence: {presence: true, message: "CTRL-LOGS-0xx : The log type is mandatory "}













private

  def set_code
    self.code = self.log_type.code +(1..9999).to_a.shuffle.to_s.rjust(4,'0')
  end



end
