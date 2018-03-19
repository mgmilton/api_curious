class HomeController < ApplicationController
  before_action :setup_connection
  def index
  end

  def show
  end

  def completeshow
  end

  private
    def setup_connection
      @conn = Faraday.new(url: "https://api.github.com/") do |request|
        request.adapter Faraday.default_adapter
      end
    end
end
