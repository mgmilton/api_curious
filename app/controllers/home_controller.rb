class HomeController < ApplicationController

  def index
    @user = GithubPresenter.new(current_user)
  end

  def show
    @user = GithubPresenter.new(current_user)
  end

  def completeshow
  end

end
