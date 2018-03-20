class AddGithubInfoToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :avatar, :string
    add_column :users, :number_of_stared_repos, :integer
    add_column :users, :followers, :integer
    add_column :users, :following, :integer
    add_column :users, :followers_url, :string
    add_column :users, :following_url, :string
  end
end
