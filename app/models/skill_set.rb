class SkillSet < ActiveRecord::Base
  has_one :chat_que
  has_and_belongs_to_many :users, join_table: :users_skill_sets

  validates :name,  presence: true, format: {with: /\A[a-zA-Z0-9.&-_@!()\s]+\z/, message: "Alphanumeric,.,&,-,_,@,!,(),space Allowed"}
   
end
