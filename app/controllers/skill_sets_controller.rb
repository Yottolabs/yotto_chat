class SkillSetsController < ApplicationController
  before_action :logged_in_user
  
  def index
    @skill_sets = SkillSet.base
  end

  def show
    @skill_set = SkillSet.find(params[:id])
  end
  def new
      @skill_set = SkillSet.new
      @users = User.all
  end
 
  def create
    @skill_set = SkillSet.new(skill_set_params)
    if @skill_set.save  
      @skill_set.users << @current_user
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

    def ancestry_options(items)
    result = []
    items.map do |item, sub_items|
      result << [yield(item), item.id]
      #this is a recursive call:
      result += ancestry_options(sub_items) {|i| "#{'-' * i.depth} #{i.name}" }
    end
    result
  end
end
