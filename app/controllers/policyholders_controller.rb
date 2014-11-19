class PolicyholdersController < ApplicationController
  
  def index
   @policyholders = Policyholder.all
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
      #redirect_to @policyholder
      redirect_to policyholders_path
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
      redirect_to @policyholder, notice: "Successfully updated policyholder."
    else
      render :edit
    end
  end
  
  def destroy
    @policyholder = Policyholder.find(params[:id])
    @policyholder.destroy
    redirect_to policyholders_url, notice: "Successfully destroyed policyholder: #{@policyholder.name}."
  end
  
  private
  def policyholder_params
    #params.require(:policyholder).permit(:name, policies_attributes: [:id, :policytype, :policyholder_id, :_destroy])
    params.require(:policyholder).permit(:name, :address, :vatnumber)
  end
end
