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
    response = @conn.get("/users/#{@user.username}/repos?per_page=100")
    parse_json(response).map do |repo|
        Repository.new(repo)
    end
  end


  private

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def all_repos
      num = (@user.public_repos / 100.0).ceil
      num.times do
        i = 1
        response = @conn.get("/users/#{@user.username}/repos?per_page=100&page=#{i}")
        JSON.parse(response.body, symbolize_names: true).map do |repo|
          Repository.new(repo)
        end
        i += 1
      end
    end
end
