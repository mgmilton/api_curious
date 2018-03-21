class Repository
  attr_reader :name, :html_url, :language, :forks

  def initialize(attributes = {})
    @name     = attributes[:name]
    @html_url = attributes[:html_url]
    @language = attributes[:language]
    @forks    = attributes[:forks]
  end
end
