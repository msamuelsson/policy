class Policyholder < ActiveRecord::Base
  has_many :policies, :dependent => :destroy
  belongs_to :user
  #accepts_nested_attributes_for :policies, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :policies, :allow_destroy => true
  #validate_presence_of :name
end