class Conversation < ActiveRecord::Base
  belongs_to :chat_que_customer
  has_many  :messages

  validates :chat_que_customer_id,  presence: true
end
