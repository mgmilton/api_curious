class HomeController < ApplicationController

  def index
  
  end

  def show
    @user = GithubPresenter.new(current_user)
  end

end
