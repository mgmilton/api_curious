class RemoveAllExtraInfoFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :name, :string
    remove_column :users, :avatar, :string
    remove_column :users, :followers, :string
    remove_column :users, :following, :string
    remove_column :users, :public_repos, :integer
    remove_column :users, :email, :string
    remove_column :users, :location, :string
    remove_column :users, :bio, :string
    remove_column :users, :company, :string
  end
end
