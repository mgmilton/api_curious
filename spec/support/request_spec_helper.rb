module RequestSpecHelper
  def stub_omniauth
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github',
      extra: {
        raw_info: {
          user_id: "1234",
          login: "Hal",
        }
      },
      credentials: {
        token: "pizza"
      }
      })
  end
end
