class Survey < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :questions
  validates :title, :presence => true
  validates :description, :presence =>true
end
