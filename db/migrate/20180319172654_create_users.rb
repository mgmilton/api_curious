class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :uid
      t.string :oauth_token
      t.string :oauth_token_secret

      t.timestamps
    end
  end
end
