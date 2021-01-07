class Exhibit
  attr_reader :name,
              :cost

  def initialize(input)
    @input = input
    @name = input[:name]
    @cost = input[:cost]
  end
end
