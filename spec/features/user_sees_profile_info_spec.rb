require "rails_helper"

feature "User sees a profile information" do
  context "upon logging in and visiting show page" do
    it "returns a users info" do
      user = create(:user,
                    username: ENV['GITHUB_TEST_LOGIN'],
                    oauth_token: ENV['GITHUB_TEST_ACCESS_TOKEN'])

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      VCR.use_cassette("user_sees_info") do

        visit '/show'

        expect(page).to have_content("mgmilton")
        expect(page).to have_content("Matt Milton")
        expect(page).to have_content("Developer in Training")
        expect(page).to have_content("Turingschool")
        expect(page).to have_content("Denver")
        expect(page).to have_content("Stars 1")
        expect(page).to have_content("Followers 5")
        expect(page).to have_content("Following 5")
      end
    end
  end
end
