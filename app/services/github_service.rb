class GithubService
  def initialize(user)
    @token = user.oauth_token
    @user = user
    @conn = Faraday.new(url: "https://api.github.com/") do |faraday|
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
      faraday.params[:access_token] = @token
    end
  end

  def find_repos
    response = @conn.get("/users/#{@user.username}/repos")
    JSON.parse(response.body, symbolize_names: true)
  end
end
