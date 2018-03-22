FactoryBot.define do
  factory :user do
    username "mgmilton"
    uid "1234"
    oauth_token ENV['GITHUB_TEST_ACCESS_TOKEN']
  end
end
