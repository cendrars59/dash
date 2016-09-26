class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  #############################################################################
  # Data  model relationships
  #############################################################################
    has_many :created_logs, class_name: 'Log', foreign_key: 'creator_id'
    has_many :owned_logs, class_name: 'Log', foreign_key: 'owner_id'
    has_many :comments

end
