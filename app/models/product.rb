class Product < ActiveRecord::Base
  default_scope :order => 'title'
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  validates :title, :description, :image_url, :presence => true
  validates :title, :uniqueness => true
  validates :price, :numericality => {:greate_than_or_equal_to => 0.01 }

  private
  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
    return true
    else
      errors.add(:base, 'Line Items present')
    return false
    end
  end
end
