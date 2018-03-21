class HomeController < ApplicationController

  def index
    @user = current_user
    binding.pry
  end

  def show
    @user = current_user
  end

  def completeshow
  end

end
