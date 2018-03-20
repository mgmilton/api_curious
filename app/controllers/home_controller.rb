class HomeController < ApplicationController

  def index
    @user = current_user
    binding.pry
  end

  def show
  end

  def completeshow
  end

end
