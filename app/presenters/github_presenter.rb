class GithubPresenter
  def initialize(user)
    @user = user
  end

  def user
    GithubService.new(@user).get_user_info(@user.username)
  end

  def repos
    GithubService.new(@user).find_repos
  end

  def starred
    GithubService.new(@user).get_starred_repos
  end

  def followers
    GithubService.new(@user).get_followers
  end

  def following
    GithubService.new(@user).get_following
  end

  def activity
    GithubService.new(@user).get_recent_events
  end

  def followers_activity
    GithubService.new(@user).get_followers_events
  end
end
