require "rails_helper"

RSpec.feature "user logs in" do
  scenario "using github oauth" do
    VCR.use_cassette("user_logs_in_with_github", :record => :new_episodes) do
      stub_omniauth
      visit "/"

      expect(page).to have_link("Sign in with GitHub")

      click_link "Sign in with GitHub"

      expect(page).to have_content("hal")
      expect(page).to have_content("Log Out")

      click_link "Log Out"
      expect(page).to have_link("Sign in with GitHub")
    end
  end
end
