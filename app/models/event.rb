class Event
  attr_reader :type,
              :actor,
              :repo,
              :created_at
  def initialize(attributes)
    @type = attributes[:type]
    @actor = attributes[:actor]
    @repo = attributes[:repo]
    @created_at = attributes[:created_at]
  end

end
