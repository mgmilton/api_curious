class Event
  attr_reader :type,
              :repo,
              :created_at
  def initialize(attributes)
    @type = attributes[:type]
    @repo = attributes[:repo]
    @created_at = attributes[:created_at]
  end

end
