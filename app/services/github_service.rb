class GithubService

  def initialize(user)
    @user = user
  end

  def get_user_info(login = user.username)
    GithubUser.new(get_json("/users/#{login}"))
  end

  def find_repos
    get_json("/users/#{user.username}/repos?per_page=100").map do |repo|
        Repository.new(repo)
    end
  end

  def get_starred_repos
    get_json("/users/#{user.username}/starred").map do |star|
        Repository.new(star)
    end
  end

  def get_followers
    get_json("/users/#{user.username}/followers").map do |user|
      get_user_info(user[:login])
    end
  end

  def get_following
    get_json("/users/#{user.username}/followers").map do |user|
      get_user_info(user[:login])
    end
  end

  def get_recent_commits(username = user.username)
    dates = (Date.today - 14).strftime('%Y-%m-%d')
    response = con.get do |req|
      req.url "/search/commits?q=author-date:>#{dates} author:#{username}"

      req.headers['Accept'] = "application/vnd.github.cloak-preview+json"
    end
    response = JSON.parse(response.body, symbolize_names: true)
    commits = []
    20.times do |x|
      commits << Commit.new(response[:items][:x][:repository][:name], response[:items][:x][:url])
    end
    commits
  end

  def get_followers_commits
    followers_commits = {}
    self.get_followers.each do |follower|
      followers_commits[follower] = get_recent_commits(follower.username)
    end
    followers_commits
  end

  private
    attr_reader :user

    def conn
      Faraday.new(url: "https://api.github.com/", :headers => headers)
    end

    def headers
      {
        "authorization" => "token " + user.oauth_token
      }
    end

    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end
end
