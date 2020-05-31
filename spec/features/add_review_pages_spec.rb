require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    test_product = Product.new({name: "safron", cost: "7", country_of_origin: " spain"})
    test_product.save
    visit products_path
    click_link "Safron"
    click_link 'Add a review'
    fill_in 'Author', :with => 'Fred Durst'
    fill_in 'Review', :with => 'git'
    fill_in 'Raiting', :with => '5'
    click_on 'Create Review'
    expect(page).to have_content 'Content body is too short (minimum is 50 characters)'
  end
end