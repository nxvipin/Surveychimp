class Survey < ActiveRecord::Base
  attr_accessible :description, :title
  validates :title, :presence => true
  validates :description, :presence =>true
end
