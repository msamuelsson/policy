class AccidentStepsController < ApplicationController
  include Wicked::Wizard
  steps :personal
  
  def show
    @accident = Accident.find(session[:accident_id])
    render_wizard 
  end
  
  def update
    @accident = Accident.find_by_id(session[:accident_id])
    @accident.update_attributes(accident_params)
    if params[:back_button]
      redirect_to edit_accident_path(@accident)
    else
      render_wizard @accident
    end
  end

private  
  def finish_wizard_path
    accident_path(@accident)
  end
  
private
  def accident_params
    #params.require(:policy).permit(:policytype, :policyholder_id, policyholder_attributes: [:id, :name, :_destroy])
    params.require(:accident).permit(:name, :address, :dateofbirth, :gender, :policy_id)
  end
  


end

