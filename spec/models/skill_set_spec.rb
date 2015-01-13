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

require 'rails_helper'

describe SkillSet do
  #pending "add some examples to (or delete) #{__FILE__}"
  
  context "Model Features" do
    
    it ".base shold return parent_nil data" do
     expect(SkillSet.base.first).to eql(SkillSet.where(:parent_id => nil).first)
    end

    it ".base should not return data with parent_id" do
      expect(SkillSet.base.first).not_to eql(SkillSet.where.not(:parent_id =>nil).first)
    end
  end
  
end
