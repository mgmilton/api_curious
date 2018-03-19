require "rails_helper"

RSpec.feature "user logs in" do
  scenario "using github oauth" do
    stub_omniauth

    visit "/"
    expect(page).to have_link("Sign in with GitHub")
    click_link "Sign in with GitHub"
    expect(page).to have_content("Hal")
    expect(page).to have_content("Logout")
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provide: 'github',
      extra: {
        raw_info: {
          user_id: "1234",
          name: "Hal",
        }
      },
      credentials: {
        token: "pizza",
        secret: "secretpizza"
      }
      })
  end
end
