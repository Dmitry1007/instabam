require "rails_helper"

RSpec.feature "User", type: :feature do
  scenario "can successfully login" do
  VCR.use_cassette('instagram_service_test#feed') do
    visit root_path

    login_user

    click_link("Login")

    expect(page).to_not have_link("Login")

    expect(page).to have_link("Logout")
    expect(page).to have_content("binky")
  end
  end
end
