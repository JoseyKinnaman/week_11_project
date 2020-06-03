require 'rails_helper'

describe "the add a review process" do
  it "gives an error when no reviews content is entered" do
    test_product = Product.new({name: "Safron", cost: 7, country_of_origin: "Spain"})
    test_product.save
    visit products_path
    click_on "Safron"
    click_on "Add a review"
    click_on "Create Review"
    expect(page).to have_content 'Content body is too short (minimum is 50 characters)'
  end
end