class Repository
  attr_reader   :name,
                :owner,
                :description,
                :html_url,
                :language,
                :fork,
                :updated_at

  def initialize(attributes = {})
    @name         = attributes[:name]
    @owner        = attributes[:owner]
    @description  = attributes[:description]
    @html_url     = attributes[:html_url]
    @language     = attributes[:language]
    @fork         = attributes[:fork]
    @updated_at   = attributes[:updated_at]
  end
end
