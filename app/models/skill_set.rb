class SkillSet < ActiveRecord::Base
  has_one :chat_que
  has_and_belongs_to_many :user

  validates :name,  presence: true
  
  validates_format_of :name, with: /\A[^`^="<>|$&]\z/, message: "Not Allows %{value}."
  #validates_exclusion_of :name, in: %w( $% #% ), message: "%{value} is Not Allowed!"
end
