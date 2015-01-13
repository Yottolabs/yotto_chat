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
      @skill_set.build_chat_que
      #@skill_set.users.build
      @users = User.all
      @base_skill_set = SkillSet.base
      @skill_sets = SkillSet.all
  end
 
  def create
    @users = User.all
    @skill_sets = SkillSet.all
    @skill_set = SkillSet.new(skill_set_params)
    
    if @skill_set.save  
      @skill_set.update_attributes(skill_set_users)
      flash[:success] = "Skill Set Added Successfully."
      redirect_to @skill_set
      # Handle a successful save.
    else
      render 'new'
    end
  end
  def edit
    @skill_set = SkillSet.find(params[:id])
    @skill_set.chat_que || @skill_set.build_chat_que
    #@skill_set.users || @skill_set.users.build
    @users = User.all
    @base_skill_set = SkillSet.base
    @skill_sets = SkillSet.all
  end

  def update
    params[:skill_set][:user_ids] ||= []
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
      params.require(:skill_set).permit(:name,:parent_id,:user_ids=>[],chat_que_attributes: [:id,:name])
    end

    def skill_set_users
      params.require(:skill_set).permit(:user_ids=>[])
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
