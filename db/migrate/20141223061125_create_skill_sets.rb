class CreateSkillSets < ActiveRecord::Migration
  def change
    create_table :skill_sets do |t|
      t.string :name
      t.integer :parent_id
      t.timestamps
    end
  end
end
