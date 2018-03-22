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

  def recent_commits
    GithubService.new(@user).get_recent_commits
  end

  def followers_commits
    GithubService.new(@user).get_followers_commits
  end
end
