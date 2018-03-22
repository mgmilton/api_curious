require "rails_helper"

feature "User sees a list of repositories on her page" do
  context "upon logging in and visiting show page" do
    it "returns a list of the users repositories" do
      json_response = File.open("./spec/fixtures/repos.json")
      stub_request(:get, "https://api.propublica.org/congress/v1/members/house/CO/current.json")
      .to_return(status: 200, body: json_response, headers: {})
      stub_omniauth
      visit '/show'

    end
  end
end


# user = create(:user,
#               username: ENV['GITHUB_TEST_LOGIN'],
#               oauth_token: ENV['GITHUB_TEST_ACCESS_TOKEN'])
#
# allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
