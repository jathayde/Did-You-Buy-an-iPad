class Purchase < ActiveRecord::Base
  validates_presence_of :email, :zip
  validates_uniqueness_of :email
#  validates_inclusion_of :buy, :in => %w( true false ) # This doesn't work
end
