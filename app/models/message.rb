class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :participant, polymorphic: true

  validates :conversation_id, presence: true
  validates :participant_id, 	presence: true
  validates :content_text, 		presence: true
  validates :participant,			presence: true 



end
