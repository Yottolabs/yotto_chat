module SkillSetsHelper
  def is_not_skillset_controller
    if params[:controller]=="skill_sets"
      return false
    else
      return true
    end
  end
  
end
