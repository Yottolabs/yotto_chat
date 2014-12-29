class ChatQuesController < ApplicationController
  before_action :logged_in_user
  
  def index
    @chat_ques = ChatQue.paginate(page: params[:page])
  end
  def show
    @chat_que = ChatQue.find(params[:id])
  end
  def new
    if logged_in?
      @chat_que = ChatQue.new
    else  
      redirect_to root_url
    end  
  end
  def create
    @chat_que = ChatQue.new(chat_que_params)
    if @chat_que.save   
      flash[:success] = "Chat Que Added Successfully."
      redirect_to @chat_que
      # Handle a successful save.
    else
      render 'new'
    end
  end
  def edit
    @chat_que = ChatQue.find(params[:id])
  end

  def update
    @chat_que = ChatQue.find(params[:id])
    if @chat_que.update_attributes(chat_que_params)
      flash[:success] = "Chat Que updated"
      redirect_to @chat_que

    else
      render 'edit'
    end
  end
  def destroy
    skillset = ChatQue.find(params[:id])
    skillset.destroy
    flash[:success] = "Chat Que deleted"
    redirect_to chat_ques_url
  end 

  private

    def chat_que_params
      params.require(:chat_que).permit(:name ,:is_active)
    end

end
