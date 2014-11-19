class Accident < ActiveRecord::Base
  belongs_to :policy
  #validate_presence_of :name
end