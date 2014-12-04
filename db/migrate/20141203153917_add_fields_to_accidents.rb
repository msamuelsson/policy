class AddFieldsToAccidents < ActiveRecord::Migration
  def change
    add_column :accidents, :flightnonpassenger, :string
    add_column :accidents, :flightnonscheduled,  :string
    add_column :accidents, :travelabroad, :string 
    add_column :accidents, :wintersport, :string
    add_column :accidents, :scubadiving, :string
    add_column :accidents, :mountainering, :string
    add_column :accidents, :potholing, :string
    add_column :accidents, :hanggliding, :date
    add_column :accidents, :horseriding, :string
    add_column :accidents, :runningrace, :string
    add_column :accidents, :scooter, :string
    add_column :accidents, :increasedrisk, :string
    add_column :accidents, :defectivehearing, :string
    add_column :accidents, :medicaltreatment, :string
    add_column :accidents, :yesdetails, :text
    add_column :accidents, :accidents, :text
    add_column :accidents, :insured, :string
    add_column :accidents, :yesinsured, :text
    add_column :accidents, :declinedcoverage, :string
    add_column :accidents, :yesdeclined, :text
  end
end
