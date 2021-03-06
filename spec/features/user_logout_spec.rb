require "rails_helper"

RSpec.feature "User", type: :feature do
  scenario "can successfully login" do
    VCR.use_cassette('user_login_test#login') do
      visit root_path

      login_user

      click_link("Login")

      expect(page).to_not have_link("Login")
      expect(page).to have_link("Logout")

      click_link("Logout")

      expect(page).to_not have_link("Logout")
      expect(page).to have_link("Login")
      expect(current_path).to eq(root_path)
    end
  end
end
