class AddParentIdToSkillSet < ActiveRecord::Migration
  def change
    add_column :skill_sets, :parent_id, :int
  end
end
