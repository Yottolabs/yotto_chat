class Customer < ActiveRecord::Base
  has_many :chat_que_customers
  has_many :chat_ques, through: :chat_que_customers
  has_many :message , as: :participant

  validates :name,  presence: true
  validates :mobile_no,  presence: true, :numericality => true,
            :length => { :minimum => 10, :maximum => 15 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX }
end
