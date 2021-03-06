class AccidentsController < ApplicationController
  
  def index
   @all_accidents = Accident.where(:policy_id => params[:accident_filter])
   @accident = Accident.where(:policy_id => params[:accident_filter]).first
   @policy = Policy.find_by_id(params[:accident_filter])
   @policyholder = Policyholder.find_by_id(@policy.policyholder_id)
 
  end
  
  def show
    @accident = Accident.find(params[:id])
  end
  
  def new 
    @accident = Accident.new
    @policy_id = params[:policy_id]
    @policy = Policy.find_by_id(@policy_id)
    @insurancestart = @policy.insurancestart
    @insuranceend =  @policy.insuranceend
  end
  
  def create
    @accident = Accident.new(accident_params)
    if @accident.save
      session[:accident_id] = @accident.id
      if params[:evalquest_button] 
        redirect_to accident_steps_path
      elsif params[:editpolicy_button]
        redirect_to edit_policy_path(@accident.policy_id)
      end    
    else
      render :new
    end
  end
  
  def edit
    @accident = Accident.find(params[:id])
    @policy_id = @accident.policy_id
  end
  
  def update
    @accident = Accident.find(params[:id])
    if @accident.update_attributes(accident_params)
      session[:accident_id] = @accident.id
      if params[:confirmation_button] 
        redirect_to accident_step_path(:id => "confirmation")
      elsif params[:editpolicy_button]
        redirect_to edit_policy_path(@accident.policy_id)   
      else
        redirect_to accident_steps_path
      end
    else
      render :edit
    end
  end
  
  def destroy
    @accident = Accident.find(params[:id])
    @accident.destroy
    redirect_to policies_url, notice: "Successfully destroyed accident."
  end
  
  private
  def accident_params
    params.require(:accident).permit(:policy_id, :name, :address, :insurancestart, :insuranceend, :phrelation, :dateofbirth, :taxcode, :gender, :weight, :height, :occupation, :smoker, :typeofsmoke, :smokequantity, :stopdate, :alcohol, :typeofalcohol, :alcoholquantity, :nrflights, :motorkm)
  end
end

    