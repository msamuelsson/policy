class UsersController < ApplicationController
  
  def index
   #@users = User.all
   @users = User.where(:role => nil)
  end
  
  def show
    @user = User.find(params[:id])
    @all_policies = Policy.where(:user_id => @user.id)
    @all_policyholders = @user.policyholders
    @new_policy = Policy.new 
    render "policies/index"
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to policies_url, notice: "Successfully destroyed user: #{@user.email}."
    end  
  end
  
  private
  def user_params
    #params.require(:policyholder).permit(:name, policies_attributes: [:id, :policytype, :policyholder_id, :_destroy])
    params.require(:user).permit(:email, :password, :role)
  end
end
