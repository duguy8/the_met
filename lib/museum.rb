class Museum
  attr_reader :name,
              :exhibits

  def initialize(name)
    @name = name
    @exhibits = Array.new
  end

  def add_exhibit(exhibit)
    @exhibits.push(exhibit)
  end
end
