class Registration < ActiveRecord::Base

  validates_presence_of :email
  validates_uniqueness_of :email, :on => :create


end
