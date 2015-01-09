# == Schema Information
#
# Table name: chat_que_customers
#
#  id          :integer          not null, primary key
#  customer_id :integer
#  chat_que_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#  status_id   :integer
#
# Indexes
#
#  index_chat_que_customers_on_chat_que_id  (chat_que_id)
#  index_chat_que_customers_on_customer_id  (customer_id)
#

class ChatQueCustomer < ActiveRecord::Base
  belongs_to :customer
  belongs_to :chat_que
  belongs_to :status
  has_one :conversation


  validates :customer_id,  presence: true
  validates :chat_que_id,  presence: true

end
