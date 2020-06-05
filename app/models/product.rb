class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name,:cost, :country_of_origin, presence: true
  validates :cost, numericality: { only_integer: true }
  validates :cost, numericality: { greater_than: 0 }
  before_save(:titleize_product)
  has_one_attached :product_photo
  

  scope :most_recent, -> { order(created_at: :desc).limit(3)}
  scope :us_made, -> {where(country_of_origin: 'United States'). limit (3)}
  scope :top_rating, -> {(select("products.id, products.name, products.cost, products.country_of_origin, count(reviews.id) as reviews_count").joins(:reviews).group("products.id").order("reviews_count DESC").limit(3))}
  # scope :search, -> (name_parameter) { where("name like ?", "%#{name_parameter}%")}


  def self.pagination_request(page)
    paginate :per_page => 10, :page => page
  end
  private
  
  def titleize_product
      self.name = self.name.titleize
    end 
end

