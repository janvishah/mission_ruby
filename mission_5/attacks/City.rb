class City < ActiveRecord::Base
  attr_accessor :id, :name, :state_id

  #belongs_to :state
  #belongs_to :country, :through => :state
end
