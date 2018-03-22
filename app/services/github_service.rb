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

  def get_recent_events(username = user.username)
    get_json("/users/#{username}/events").map do |event|
      Event.new(event)
    end
  end

  def get_followers_events
    get_followers.map do |follower|
      get_recent_events(follower.username)
    end.flatten
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
