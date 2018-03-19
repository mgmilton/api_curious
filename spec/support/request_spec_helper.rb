module RequestSpecHelper
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
