# == Schema Information
#
# Table name: chat_ques
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  is_active    :boolean
#  created_at   :datetime
#  updated_at   :datetime
#  skill_set_id :integer
#

class ChatQue < ActiveRecord::Base
  has_many :chat_que_customers
  has_many :customers, through: :chat_que_customers

  validates :name,  presence: true, format: {with: /\A[a-zA-Z0-9.&-_@!()\s]+\z/, message: "Alphanumeric,.,&,-,_,@,!,(),space Allowed"}
  validates :skill_set_id,  presence: true
end
