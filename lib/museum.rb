class Museum
  attr_reader :name,
              :exhibits,
              :patrons

  def initialize(name)
    @name = name
    @exhibits = Array.new
    @patrons = Array.new
  end

  def draw_lottery_winner(exhibit)
    contestants = @patrons.find_all do |patron|
      (patron.interests.include?(exhibit.name)) &&
      (patron.spending_money <= exhibit.cost)
    end
    contestants.sample
  end

  def ticket_lottery_contestants(exhibit)
    @patrons.find_all do |patron|
      (patron.interests.include?(exhibit.name)) &&
      (patron.spending_money <= exhibit.cost)
    end
  end

  def patrons_by_exhibit_interest
    hash = {}
    @exhibits.each do |exhibit|
      @patrons.each do |patron|
        if patron.interests.include?(exhibit.name)
          hash[exhibit] << [patron]
        elsif !patron.interests.include?(exhibit.name)
          hash[exhibit] = []
        end
      end
    end
    hash
  end

  def admit(patron)
    @patrons.push(patron)
  end

  def add_exhibit(exhibit)
    @exhibits.push(exhibit)
  end

  def recommend_exhibits(patron)
    @exhibits.find_all do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end
end
