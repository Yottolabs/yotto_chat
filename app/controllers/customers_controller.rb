class CustomersController < ApplicationController
  before_action :logged_in_user, only: [:index]
  def index
    #@customers = Customer.all
    #@chat_que_customers = ChatQueCustomer.all
    @current_user_skill_sets = @current_user.skill_sets
    #@customers = chat_que_customers.customer
    #@customers = customer.chat_que_customers
  end
  def new
    @customer = Customer.new
    @skill_sets = SkillSet.base
  end
  def create
    
    #@chat_que = ChatQue.find_by_skill_set_id(params[:skill_set_id])
    @find_customer = Customer.find_by_mobile_no(params[:customer][:mobile_no])
    @customer = Customer.new(customer_params) 
    
    if @find_customer
      @find_customer.chat_ques << ChatQue.find_by_skill_set_id(params[:skill_set][:parent_id])
      flash[:success] = "Welcome to the Yotto Chat App! Please Wait Our Agent Will Serve You Soon."
      
      redirect_to customers_home_path
    else
      if @customer.save 
         @customer.chat_ques << ChatQue.find_by_skill_set_id(params[:skill_set][:parent_id])
        #@customer.chat_ques << @chat_que
        #_cqc = ChatQueCustomer.new
        #_cqc.customer = @customer
        #_cqc.chat_que = @chat_que
        #_cqc.save
        #@customer.save
        flash[:success] = "Welcome to the Yotto Chat App! Please Wait Our Agent Will Serve You Soon."

        redirect_to customers_home_path
         # Handle a successful save.
      else
        @skill_sets = SkillSet.base
        render 'new'
      end
    end  
  end

  private

    def customer_params
      params.require(:customer).permit(:name, :email, :mobile_no)
    end
    def chat_que_customer_params
      params.require(:chat_que_customer).permit(:customer_id, :chat_que_id)
    end
end
