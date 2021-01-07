require 'minitest/autorun'
require 'minitest/pride'
require './lib/exhibit'
require './lib/patron'
require './lib/museum'

class MuseumTest < Minitest::Test
  def test_museum_exists
    dmns = Museum.new("Denver Museum of Nature and Science")
    assert_instance_of Museum, dmns
  end

  def test_museum_attributes
    dmns = Museum.new("Denver Museum of Nature and Science")
    assert_equal "Denver Museum of Nature and Science", dmns.name
    assert_equal ([]), dmns.exhibits
  end

  def test_museum_can_add_exhibits
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    expected = [gems_and_minerals, dead_sea_scrolls, imax]
    assert_equal expected, dmns.exhibits
  end

  def test_museum_recommend_exhibits
    dmns = Museum.new("Denver Museum of Nature and Science")

    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})

    patron_1 = Patron.new("Bob", 20)
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    patron_2 = Patron.new("Sally", 20)
    patron_2.add_interest("IMAX")


    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)

    expected_patron1 = [dead_sea_scrolls, gems_and_minerals]
    assert_equal expected_patron1, dmns.recommend_exhibits(patron_1)

    expected_patron2 = [imax]
    assert_equal expected_patron2, dmns.recommend_exhibits(patron_2)
  end
end
