class CreatePolicyholders < ActiveRecord::Migration
  def change
    create_table :policyholders do |t|
      t.string :name
      t.string :address
      t.string :vatnumber
      t.timestamps
    end
  end
end
