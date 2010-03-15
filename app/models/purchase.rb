class Purchase < ActiveRecord::Base
  validates_presence_of :email, :zip, :buy
end
