class Policy < ActiveRecord::Base
  
  #def self.all_policytypes ; %w[accident fvplants] ; end #  shortcut: array of strings
  def self.all_policytypes ; %W[Accident\ and\ Illness fvplants] ; end #  shortcut: array of strings
  
  has_many :accidents, :dependent => :destroy
  has_many :fvplants, :dependent => :destroy
  belongs_to :policyholder
 
  accepts_nested_attributes_for :accidents, :allow_destroy => true
  accepts_nested_attributes_for :fvplants, :allow_destroy => true
  #accepts_nested_attributes_for :accidents, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  #accepts_nested_attributes_for :fvplants, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  
end