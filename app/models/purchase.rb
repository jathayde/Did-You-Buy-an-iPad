class Purchase < ActiveRecord::Base
  validates_presence_of :email, :zip, :buy
  validates_uniqueness_of :email
end
