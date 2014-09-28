require "minitest/autorun"
require "fifteen"

class FifteenTest < MiniTest::Unit::TestCase

  def test_are_there_two_players_to_start_with_no_cards
    @player_1 = []
    @cpu = []
    assert_equal player_1, cpu
  end
  def test_are_there_numbers_to_choose_from
    cards = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8, 9], cards
  end
  def test_are_there_nine_cards
    cards = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    card = cards
  end

  def test_can_a_number_be_chosen_twice
    cards = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    pick = 5
    @player_1 << pick
    @cards.delete(pick)
    cpu_pick = 5
    @cpu << cpu_pick
    assert_nil cpu_pick,"Number not available"
  end
  def test_once_a_number_is_chosen_does_it_get_removed_from_avail
    cards = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    pick = 5
    @cards.delete(pick)
    assert true [1, 2, 3, 4, 6, 7, 8, 9],cards

  end
  def test_player_cant_pick_numbers_outside_of_a_1_or_9
    @deck = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    pick = 5
    assert_true 5, @deck.include?
  end
end
