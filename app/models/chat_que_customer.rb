class ChatQueCustomer < ActiveRecord::Base
  belongs_to :customer
  belongs_to :chat_que
  belongs_to :status
  has_one :conversation


  validates :customer_id,  presence: true
  validates :chat_que_id,  presence: true

end
