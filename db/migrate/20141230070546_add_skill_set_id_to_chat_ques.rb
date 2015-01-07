class AddSkillSetIdToChatQues < ActiveRecord::Migration
  def change
    add_column :chat_ques, :skill_set_id, :integer
  end
end
