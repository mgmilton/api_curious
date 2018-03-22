require "rails_helper"

feature "User sees a list of repositories on her page" do
  context "upon logging in and visiting show page" do
    it "returns a list of the users repositories" do
      user = create(:user,
                    username: ENV['GITHUB_TEST_LOGIN'],
                    oauth_token: ENV['GITHUB_TEST_ACCESS_TOKEN'])

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      VCR.use_cassette("user_sees_repos") do

        visit '/show'

        expect(page).to have_css(".repo", count: 100)

        within(first(".repo")) do
          expect(page).to have_content("activerecord_exploration")
        end
      end
    end
  end
end
