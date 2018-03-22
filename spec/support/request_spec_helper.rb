module RequestSpecHelper
  def stub_omniauth
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github',
      extra: {
        raw_info: {
          uid: "1234",
          login: "Hal",
        }
      },
      credentials: {
        token: ENV['GITHUB_TEST_ACCESS_TOKEN']
      }
      })
  end
end
