class CreateSkillSetsUsers < ActiveRecord::Migration
  def change
    create_table :skill_sets_users, id: false do |t|
      t.integer :user_id
      t.integer :skill_set_id
    end
  end
end
