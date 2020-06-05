require 'rails_helper'

describe "#Users" do
    it "should have a user sign up" do
      visit new_user_registration_path
      fill_in "user[email]", :with => 'test@test.com'
      fill_in "user[password]", :with => 'test57'
      fill_in "user[password_confirmation]", :with => 'test57'
      click_on 'Sign up'
      expect(page).to have_content 'test@test.com'
  end
end