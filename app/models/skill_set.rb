# == Schema Information
#
# Table name: skill_sets
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  parent_id  :integer
#

class SkillSet < ActiveRecord::Base
  has_one :chat_que, inverse_of: :skill_set
  accepts_nested_attributes_for :chat_que, reject_if: :reject_chat_que

  has_and_belongs_to_many :users
  # accepts_nested_attributes_for :users, reject_if: :reject_user

  with_options foreign_key: :parent_id, class_name: 'SkillSet' do |skillset|
    skillset.belongs_to :parent
    skillset.has_many   :children
  end

  validates :name,  presence: true, format: {with: /\A[a-zA-Z0-9.&-_@!()\s]+\z/, message: "Alphanumeric,.,&,-,_,@,!,(),space Allowed"}

  scope :base, -> {where(parent_id: nil)}
 
  def reject_user(attributed)
    binding.pry
    #attributed[:name].blank?
  end

  def reject_chat_que(attributed)
    attributed[:name].blank?
  end

 end
