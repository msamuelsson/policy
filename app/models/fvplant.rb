class Fvplant < ActiveRecord::Base
  belongs_to :policy
  #validate_presence_of :address
end