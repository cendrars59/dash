# == Schema Information
#
# Table name: logs
#
#  id                     :integer          not null, primary key
#  code                   :string
#  label                  :string
#  description            :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  log_stage_id           :integer
#  log_status_id          :integer
#  log_type_id            :integer
#  log_added_value_id     :integer
#  expectation            :text
#  creator_id             :integer
#  owner_id               :integer
#  expected_milestone_id  :integer
#  confirmed_milestone_id :integer
#
# Indexes
#
#  index_logs_on_log_added_value_id  (log_added_value_id)
#  index_logs_on_log_stage_id        (log_stage_id)
#  index_logs_on_log_status_id       (log_status_id)
#  index_logs_on_log_type_id         (log_type_id)
#
# Foreign Keys
#
#  fk_rails_5d8142ca38  (log_added_value_id => log_added_values.id)
#  fk_rails_a7b0e10252  (log_stage_id => log_stages.id)
#  fk_rails_d4bbae0d68  (log_type_id => log_types.id)
#  fk_rails_e8a3b31969  (log_status_id => log_statuses.id)
#

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
  belongs_to :expected_milestone, class_name: 'Milestone'
  belongs_to :confirmed_milestone, class_name: 'Milestone'
  belongs_to :creator, class_name: 'User'
  belongs_to :owner, class_name: 'User'

  # Destroy is used in order to ensure when the log is deleted then 
  # the comments related with are also deleted 
  has_many :comments, dependent: :destroy
  has_many :log_screens, dependent: :destroy

  

#############################################################################
# Log business rules and validation
#############################################################################


##################### Business rules #######################################

  # BR-LOGS-001 : If controls are valid then generate the code according the
  # following statement
  # Then the code is generated if the code is not already created or the log type
  # has been changed
  # code = log_type.code + random number between 1 and 9999
  # the random number has to be in format NNNN (4 digits)
  # IE : CR0001


  before_validation :set_code , if: :log_type?


  # BR-LOGS-002 : Generating CSV file for log export

  def self.to_csv
    attributes = %w{code label description code_type label_type code_status label_status}
    CSV.generate(headers:true) do |csv|
      csv << attributes
      all.each do |log|
        csv << [log.code, log.label,log.description,log.log_type.code, log.log_type.label,
         log.log_status.code,log.log_status.label ]
      end
    end
  end









####################### validation ##########################################

######## Validation on log type

  # CTRL-LOGS-007 : The log type is mandatory
  validates :log_type, presence: {presence: true, message: "CTRL-LOGS-007 : The log type is mandatory "}

######## Validation on log status

  # CTRL-LOGS-008 : The log status is mandatory
  validates :log_status, presence: {presence: true, message: "CTRL-LOGS-008 : The log status is mandatory "}

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

  # CTRL-LOGS-009 : The description is mandatory
  validates :description, length: {minimum: @description_min_length, message: "CTRL-LOGS-008 : The description length can not be below #{@description_min_length} caracters" }


######## After saving log 

  # CTRL-LOGS-010 : The description is mandatory

  after_save :send_mail_to_creator

private


  def set_code
    if self.code == nil or log_type.code[0..1] != self.code[0..1]
      temp_code = generate_code(self.log_type.code)
      while Log.exists?(code: temp_code)
        temp_code = generate_code
      end
      self.code = temp_code
    end
  end


  def generate_code(log_type_code)
    code = ""
    code = log_type_code + rand(9999).to_s.rjust(4,'0')
  end

  def log_type? 
    self.log_type != nil 
  end 


  def send_mail_to_creator

    UserMailer.log_notification_email(self.creator).deliver_now

  end 





end

#############################################################################
# End of file
#############################################################################
