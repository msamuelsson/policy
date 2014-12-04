class AccidentStepsController < ApplicationController
  include Wicked::Wizard
  steps :evalquest, :confirmation
  
  def show
    @accident = Accident.find(session[:accident_id])
    render_wizard 
  end
  
  def edit
    render_wizard
  end
  
  def update
    @accident = Accident.find_by_id(session[:accident_id])
    @accident.update_attributes(accident_params)
    if params[:editaccident_button]
      redirect_to edit_accident_path(@accident)
    elsif params[:back_button]
      redirect_to previous_wizard_path
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
    #params.require(:accident).permit(:name, :address, :dateofbirth, :gender, :policy_id, :flightnonpassenger)
    params.require(:accident).permit(:flightnonpassenger, :flightnonscheduled, :travelabroad, :wintersport, :scubadiving, :mountainering, :potholing, :hanggliding, :horseriding, :runningrace, :scooter, :increasedrisk, :defectivehearing, :medicaltreatment, :yesdetails, :accidents, :insured, :yesinsured, :declinedcoverage, :yesdeclined)
  end
  


end