class Product < ActiveRecord::Base
  default_scope :order => 'title'
  validates :title, :description, :image_url, :presence => true
  validates :title, :uniqueness => true
  validates :price, :numericality => {:greate_than_or_equal_to => 0.01 }
end
