class AddInsuranceperiodToPolicies < ActiveRecord::Migration
  def change
    add_column :policies, :insurancestart, :date
    add_column :policies, :insuranceend, :date
  end
end
