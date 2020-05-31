class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name,:cost, :country_of_origin, presence: true
  before_save(:titleize_product)

  def self.pagination_request(page)
    paginate :per_page => 10, :page => page
  end
  private
  
  def titleize_product
      self.name = self.name.titleize
    end 
end