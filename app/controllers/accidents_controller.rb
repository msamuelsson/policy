class AccidentsController < ApplicationController
  
  def index
   @all_accidents = Accident.where(:policy_id => params[:accident_filter])
   @policy = Policy.find_by_id(params[:accident_filter])
   @policyholder = Policyholder.find_by_id(@policy.policyholder_id)
  end
  
  def show
    @accident = Accident.find(params[:id])
  end
  
  def new 
    @accident = Accident.new
    @policy_id = params[:policy_id]
  end
  
  def create
    @accident = Accident.new(accident_params)
    if @accident.save
      redirect_to accident_path(@accident), notice: "Successfully created accident."
    else
      render :new
    end
  end
  
  def edit
    @accident = Accident.find(params[:id])
  end
  
  def update
    @accident = Accident.find(params[:id])
    if @accident.update_attributes(params[:accident])
      redirect_to @accident, notice: "Successfully updated accident."
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
    #params.require(:policy).permit(:policytype, :policyholder_id, policyholder_attributes: [:id, :name, :_destroy])
    params.require(:accident).permit(:name, :address, :dateofbirth, :gender, :policy_id)
  end
end

    