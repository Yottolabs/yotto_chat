class Conversation < ActiveRecord::Base
  belongs_to :chat_que_customer
  belongs_to :status
  has_many  :messages

  validates :chat_que_customer_id,  presence: true
  validates :status_id,  presence: true
end
