class GithubPresenter
  def initialize(user)
    @user = user
  end

  def repos
    GithubService.new(@user).find_repos
  end

  def user
    GithubService.new(@user).get_user_info(@user.username)
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
end
