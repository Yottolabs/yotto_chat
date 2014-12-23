class ChatQue < ActiveRecord::Base
  has_many :customers, through: :chat_que_customers

  validates :name,  presence: true, format: {with: /\A[a-zA-Z0-9.&-_@!()\s]+\z/, message: "Alphanumeric,.,&,-,_,@,!,(),space Allowed"}
end
