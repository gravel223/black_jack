class User < Player
  attr_reader :name
  def initialize(name)
    super(name)
  end
end
