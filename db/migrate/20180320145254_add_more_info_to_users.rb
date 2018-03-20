class AddMoreInfoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :public_repos, :integer
    add_column :users, :email, :string
    add_column :users, :location, :string
    add_column :users, :bio, :string
    add_column :users, :company, :string
  end
end
