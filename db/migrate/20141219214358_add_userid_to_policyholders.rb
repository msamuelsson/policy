class AddUseridToPolicyholders < ActiveRecord::Migration
  def change
    add_column :policyholders, :user_id, :integer
  end
end
