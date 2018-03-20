require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates or updates itself from oauth hash" do
    auth = {provider: 'github',
          extra: {
            raw_info: {
              user_id: "1234",
              name: "Hal",
            }
          },
          credentials: {
            token: "pizza"
          }}
    User.update_or_create(auth)
    new_user = User.first
    expect(new_user.uid).to eq("1234")
    expect(new_user.username).to eq("Hal")
    expect(new_user.oauth_token).to eq("pizza")
  end
end
