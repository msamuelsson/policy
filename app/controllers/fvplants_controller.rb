class FvplantsController < ApplicationController
  
  def index
   @all_fvplants = Fvplant.where(:policy_id => params[:fvplant_filter])
   @policy = Policy.find_by_id(params[:fvplant_filter])
   @policyholder = Policyholder.find_by_id(@policy.policyholder_id)
  end
  
  def show
    @fvplant = Fvplant.where(:id => params[:id])
    #@policy_id = @fvplant.policy_id
    #policy = Policy.where(:id => policy_id)
    #@policyholder = Policyholder.find_by_id(policy.policyholder_id)
  end
  
  def new 
    @fvplant = Fvplant.new
    @policy_id = params[:policy_id]
  end
  
  def create
    @fvplant = Fvplant.new(fvplant_params)
    if @fvplant.save
      redirect_to fvplant_path(@fvplant), notice: "Successfully created fvplant."
    else
      render :new
    end
  end
  
  def edit
    @fvplant = Fvplant.find(params[:id])
  end
  
  def update
    @fvplant = Fvplant.find(params[:id])
    if @fvplant.update_attributes(fvplant_params)
      redirect_to @fvplant, notice: "Successfully updated fvplant."
    else
      render :edit
    end
  end
  
  def destroy
    @fvplant = Fvplant.find(params[:id])
    @fvplant.destroy
    redirect_to policies_url, notice: "Successfully destroyed fvplant."
  end
  
  private
  def fvplant_params
    #params.require(:policy).permit(:policytype, :policyholder_id, policyholder_attributes: [:id, :name, :_destroy])
    params.require(:fvplant).permit(:address, :gps, :yearofconstruction, :fvtypology, :policy_id)
  end
end
