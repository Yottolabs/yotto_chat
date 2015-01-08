# == Schema Information
#
# Table name: messages
#
#  id               :integer          not null, primary key
#  content_text     :text
#  conversation_id  :integer
#  participant_id   :integer
#  participant_type :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#
# Indexes
#
#  index_messages_on_conversation_id  (conversation_id)
#  index_messages_on_participant_id   (participant_id)
#

class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :participant, polymorphic: true

  validates :conversation_id, presence: true
  validates :participant_id, 	presence: true
  validates :content_text, 		presence: true
  validates :participant,			presence: true 



end
