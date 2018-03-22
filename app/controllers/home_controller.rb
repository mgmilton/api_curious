class HomeController < ApplicationController
  def index
  end

  def show
    @user = GithubService.new(current_user)
  end

end
