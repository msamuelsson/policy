class AddMorefieldsToAccidents < ActiveRecord::Migration
  def change
    add_column :accidents, :insurancestart, :date
    add_column :accidents, :insuranceend, :date
    add_column :accidents, :phrelation, :string
  end
end
