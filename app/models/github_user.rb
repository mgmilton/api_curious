class GithubUser
  attr_reader :username,
              :name,
              :avatar,
              :company,
              :location,
              :email,
              :bio,
              :public_repos_count,
              :followers_count,
              :following_count
              
  def initialize(attributes)
    @username = attributes[:login]
    @name = attributes[:name]
    @avatar = attributes[:avatar_url]
    @company = attributes[:company]
    @location = attributes[:location]
    @email = attributes[:email]
    @bio = attributes[:bio]
    @public_repos_count = attributes[:public_repos]
    @followers_count = attributes[:followers]
    @following_count = attributes[:following]
  end

end
