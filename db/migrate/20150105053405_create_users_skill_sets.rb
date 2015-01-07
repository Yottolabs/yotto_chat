class CreateUsersSkillSets < ActiveRecord::Migration
  def change
    create_table :users_skill_sets, id: false do |t|
      t.integer :user_id
      t.integer :skill_set_id
    end
  end
end
