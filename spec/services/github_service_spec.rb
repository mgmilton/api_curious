require "rails_helper"

describe GithubService do
  it "has a collection of github user data" do
    VCR.use_cassette("github service") do
      user = create(:user,
                    username: ENV['GITHUB_TEST_LOGIN'],
                    oauth_token: ENV['GITHUB_TEST_ACCESS_TOKEN'])

      subject = GithubService.new(user)

      expect(subject.find_repos.count). to eq(100)
      expect(subject.get_starred_repos.count). to eq(1)
    end
  end
end
