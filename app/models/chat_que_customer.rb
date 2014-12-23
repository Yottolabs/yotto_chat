class ChatQueCustomer < ActiveRecord::Base
  belongs_to :customer
  belongs_to :chat_que
  has_one :conversation

  validates :customer_id,  presence: true
  validates :cha_que_id,  presence: true
end
