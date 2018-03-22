require "rails_helper"

RSpec.feature "user logs in" do
  scenario "using github oauth" do
      stub_omniauth
      visit "/"

      expect(page).to have_link("Sign in with GitHub")

      click_link "Sign in with GitHub"

      expect(page).to have_content("Hal")
      expect(page).to have_content("Logout")

      click_link "Logout"
      expect(page).to have_link("Sign in with GitHub")
    end
end
