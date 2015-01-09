# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#  remember_digest :string(255)
#


class User < ActiveRecord::Base
	 include AuthModel

   has_and_belongs_to_many :skill_sets, join_table: :users_skill_sets

end
