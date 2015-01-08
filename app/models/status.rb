# == Schema Information
#
# Table name: statuses
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Status < ActiveRecord::Base
  before_save { self.name = name.downcase }
  validates :name,  presence: true, uniqueness: { case_sensitive: false }
end
