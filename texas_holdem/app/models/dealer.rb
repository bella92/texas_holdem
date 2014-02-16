class Dealer
  attr_accessor :players, :table

  def initialize(players, table)
    @deck = Deck.new
    @players = players
    @table = table
  end

  def deal_to_players
    2.times do
      @players.foreach do |player|
        cards = @deck.take_cards(1)
        player.pocket.concat(cards)
      end
    end
  end

  def deal_to_board(cards_count)
    @deck.pop(1)
    cards = deck.take_cards(cards_count)
    table.board.concat(cards)
  end
end