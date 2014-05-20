class Country < ActiveRecord::Base
  attr_accessor :id, :name

  has_many :states
  has_many :cities, :through => :state
end
