module RequestSpecHelper
  def stub_omniauth
    JSON.parse(response.body)
  end
end
