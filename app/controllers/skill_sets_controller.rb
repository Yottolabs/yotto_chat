class SkillSetsController < ApplicationController
  before_action :logged_in_user
  
  def index
    @skill_sets = SkillSet.paginate(page: params[:page])
  end
  def show
    @skill_set = SkillSet.find(params[:id])
  end
  def new
    if logged_in?
      @skill_set = SkillSet.new
    else  
      redirect_to root_url
    end  
  end
  def create
    @skill_set = SkillSet.new(skill_set_params)
    if @skill_set.save   
      flash[:success] = "Skill Set Added Successfully."
      redirect_to @skill_set
      # Handle a successful save.
    else
      render 'new'
    end
  end
  def edit
    @skill_set = SkillSet.find(params[:id])
  end

  def update
    @skill_set = SkillSet.find(params[:id])
    if @skill_set.update_attributes(skill_set_params)
      flash[:success] = "Skill Set updated"
      redirect_to @skill_set

    else
      render 'edit'
    end
  end
  def destroy
    skillset = SkillSet.find(params[:id])
    skillset.destroy
    flash[:success] = "Skill Set deleted"
    redirect_to skill_sets_url
  end 

  private

    def skill_set_params
      params.require(:skill_set).permit(:name)
    end
end
