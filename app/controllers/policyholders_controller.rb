class PolicyholdersController < ApplicationController
  
  def index
   @policyholders = Policyholder.where(:user_id => current_user.id)
  end
  
  def show
    @policyholder = Policyholder.find(params[:id])
  end
  
  def new
    @policyholder = Policyholder.new
  end
  
  def create
    @policyholder = Policyholder.new(policyholder_params)
    if @policyholder.save
      flash[:notice] = "Successfully created policyholder."       
      redirect_to policies_path 
    else
      render :new
    end
  end
  
  def edit
    @policyholder = Policyholder.find(params[:id])
  end
  
  def update
    @policyholder = Policyholder.find(params[:id])
    if @policyholder.update_attributes(policyholder_params)
      redirect_to policies_path, notice: "Successfully updated policyholder."
    else
      render :edit
    end
  end
  
  def destroy
    @policyholder = Policyholder.find(params[:id])
    @policyholder.destroy
    redirect_to policies_url, notice: "Successfully destroyed policyholder: #{@policyholder.name}."
  end
  
  private
  def policyholder_params
    params.require(:policyholder).permit(:name, :address, :vatnumber, :user_id)
  end
end
