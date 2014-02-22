require_relative "../poker_engine/hand.rb"

class Evaluater
  def find_winners(table, players_in_game)
    players_hands = Hash[players_in_game.map { |player| [player, Hand.new(player.pocket + table.board)] }]
    sorted_players_hands = players_hands.sort_by { |_player, hand| hand }
    sorted_players_hands.take_while do |player_hand|
      (player_hand.last <=> sorted_players_hands.first.last) == 0
    end
    sorted_players_hands.map { |player_hand| player_hand.first }
  end
end