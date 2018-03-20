class GithubService
  attr_reader :conn, :token
  def initialize(user)
    @token = user.oauth_token
    @conn = Faraday.new(url: "https://api.github.com/") do |faraday|
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
      faraday.params[:access_token] = @token
    end
  end

  def find_repos
    response = @conn.get("/users/repo")
    JSON.parse(response.body)
  end

  def get_url(url)
    response = @conn.get(url)
    JSON.parse(response.body, symbolize_names: true)[:results]
  end
end
