class ChatQueCustomer < ActiveRecord::Base
  belongs_to :customer
  belongs_to :chat_que
  has_one :conversation
end
