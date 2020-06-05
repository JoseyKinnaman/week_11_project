class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name,:cost, :country_of_origin, presence: true
  validates :cost, numericality: { only_integer: true }
  validates :cost, numericality: { greater_than: 0 }
  before_save(:titleize_product)
  

  scope :most_recent, -> { order(created_at: :desc).limit(3)}
  scope :top_rating, -> {(select("products.id, products.name, products.cost, products.country_of_origin, count(reviews.id) as reviews_count").joins(:reviews).group("products.id").order("reviews_count DESC").limit(3))}


  def self.pagination_request(page)
    paginate :per_page => 10, :page => page
  end
  private
  
  def titleize_product
      self.name = self.name.titleize
    end 
end

