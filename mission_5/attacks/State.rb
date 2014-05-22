class State < ActiveRecord::Base
  attr_accessor :id, :name, :country_id

  #belongs_to :country
  has_many :cities
end
