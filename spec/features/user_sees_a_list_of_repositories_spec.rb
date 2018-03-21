require "rails_helper"

feature "User sees a list of repositories on her page" do
  context "upon logging in and visiting show page" do
    it "returns a list of the users repositories" do
      stub_omniauth
      visit '/show'

    end
  end
end
