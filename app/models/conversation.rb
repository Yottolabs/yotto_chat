# == Schema Information
#
# Table name: conversations
#
#  id                   :integer          not null, primary key
#  chat_que_customer_id :integer
#  created_at           :datetime
#  updated_at           :datetime
#  status_id            :integer
#
# Indexes
#
#  index_conversations_on_chat_que_customer_id  (chat_que_customer_id)
#

class Conversation < ActiveRecord::Base
  belongs_to :chat_que_customer
  belongs_to :status
  has_many  :messages

  validates :chat_que_customer_id,  presence: true
  validates :status_id,  presence: true
end
