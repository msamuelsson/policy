class AddLastfieldsToAccidents < ActiveRecord::Migration
  def change
    change_column :accidents, :hanggliding, :string
    add_column :accidents, :confmaxsum, :string
    add_column :accidents, :benefic, :string
    add_column :accidents, :signass, :string
    add_column :accidents, :dateass, :date
    add_column :accidents, :signph, :string
    add_column :accidents, :dateph, :date
    add_column :accidents, :addinfo, :text
  end
end
