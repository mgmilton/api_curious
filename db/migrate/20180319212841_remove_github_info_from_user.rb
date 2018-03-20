class RemoveGithubInfoFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :name, :string
    remove_column :users, :avatar, :string
    remove_column :users, :number_of_stared_repos, :integer
    remove_column :users, :followers, :integer
    remove_column :users, :following, :integer
    remove_column :users, :followers_url, :string
    remove_column :users, :following_url, :string
  end
end
