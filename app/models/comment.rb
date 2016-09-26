class Comment < ApplicationRecord

#############################################################################
# Data  model relationships
#############################################################################
  belongs_to :log
  belongs_to :user


end
