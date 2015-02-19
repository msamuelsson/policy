class PoliciesController < ApplicationController
  
  
  def index
   #@all_policies = Policy.all
   @all_policies = Policy.where(:user_id => current_user.id)
   @all_policyholders = Policyholder.where(:user_id => current_user.id)
   @new_policy = Policy.new 
   #render :dashbord
  end
  
  def create_policy
    @policy = Policy.new(policy_params)
    if @policy.save
      case @policy.policytype
      when 'Accident and Illness'
        redirect_to new_policy_accident_path(@policy)
      when 'fvplants'
        redirect_to new_policy_fvplant_path(@policy)
      end   
    else
      flash[:notice]= "Policy could not be created."
    end  
  end
  
  def show
    @policy_id = params[:id]
    @policy = Policy.find_by_id(@policy_id)
    policyholder_id = @policy.policyholder_id
    @policyholder = Policyholder.find_by_id(policyholder_id)
    case @policy.policytype
      when 'Accident and Illness'
        redirect_to accidents_path(:accident_filter => @policy.id)
        #redirect_to accidents_path(:policy_id => @policy.id)
      when 'fvplants'
        #@fvplant = Fvplant.where(:policy_id => @policy_id)
        #redirect_to fvplant_path(@fvplant)
        redirect_to fvplants_path(:fvplant_filter => @policy_id)
      end   
  end
  
  def new
    @policyholder = Policyholder.find_by_id(params[:policyholder_id])
    @policy ||= @policyholder.policies.new
  end
  
  def create
    @policyholder = Policyholder.find_by_id(params[:policyholder_id])
    session[:policyholder_id] = params[:policyholder_id]
    @policy = Policy.new(policy_params)
    if @policy.save
      #redirect_to @policy, notice: "Successfully created policy."
      redirect_to policyholder_policies_path(:policyholder_id => @policy.policyholder_id), notice: "Successfully created policy."
      #redirect_to new_policy_accident(@policy.id)
    else
      render :new
    end
  end
  
  def edit
    @all_policyholders = Policyholder.all
    @policy = Policy.find(params[:id]) 
  end
  
  def update
    @policy = Policy.find(params[:id])
    if @policy.update_attributes(policy_params)
      if params[:editaccident_button] 
        if session[:accident_id]
          @accident = Accident.find_by_id(session[:accident_id])
          redirect_to edit_accident_path(@accident)  
        else
          redirect_to new_policy_accident_path(@policy)
        end 
      elsif params[:confirmation_button] 
        redirect_to accident_step_path(:id => "confirmation") 
      end  
    else
      render :edit
    end
  end
  
  def destroy
    @policy = Policy.find(params[:id])
    @policy.destroy
    redirect_to policies_path, notice: "Successfully destroyed policy."
  end
  
  private
  def policy_params
    params.require(:policy).permit(:policytype, :policyholder_id, :insurancestart, :insuranceend, :user_id)
  end
end

    
