class Review < ApplicationRecord
  belongs_to :product
  validates :author, :content_body, :rating, presence: true
  validates :content_body, length: {  minimum: 50, maximum: 250 }
end