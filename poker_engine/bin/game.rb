require_relative "../lib/poker_engine/table.rb"
require_relative "../lib/poker_engine/dealer.rb"
require_relative "../lib/poker_engine/player.rb"
require_relative "../lib/poker_engine/bet.rb"
 
module Attachable
  def attach(event, *methods)
    define_method(event) do |*args|
      methods.each do |method|
        send method, *args
      end
    end
  end
 
  def self.included(klass)
    p klass
    klass.extend self
  end
end
 
 
module Game
  Fold, Check, Bet, Call, Raise = 1.upto(5)
  BigBlind = 20;

  def set_players(players)
    players.each { |player| @table.add_player player }
  end

  def set_blinds
    @table.rotate_players
    @table.players[0].buck = true
    @table.players[1].decrease_bankroll(BigBlind / 2)
    @table.players[2].decrease_bankroll(BigBlind)
  end
 
  def betting_round
    @table.players.each do |player|
      bet = Bet.new(@table.pot, @table.players)
      before_betting(player)
      after_betting(player)
    end
  end

  def betting(bet_type, player, amount)
    bet = Bet.new(@table.pot, @table.players)
    case bet_type
    when Fold then bet.fold(player)
    when Check then bet.check(player)
    when Bet then bet.bet(player, amount)
    when Call then bet.call(player)
    when Raise then bet.raise(player, amount)
    end
  end
 
  def evaluate
    #evaluation
  end
 
  def play
    @table = Table.new
    @dealer = Dealer.new
 
    before_deal

    @dealer.shuffle_deck
    @dealer.deal_preflop(@table)

    after_deal
 
    betting_round
 
    @dealer.deal_to_board(@table, 3) # flop
    after_deal_to_board
 
    betting_round
 
    @dealer.deal_to_board(@table, 1) # turn
    after_deal_to_board
 
    betting_round
 
    @dealer.deal_to_board(@table, 1) # river
    after_deal_to_board
 
    betting_round
 
    evaluate
    after_evaluation
  end
end
 
 
class ConsoleClient
  include Attachable
  include Game
 
  attach :before_deal, :set_game_players
  attach :after_deal, :show_players
  attach :after_deal_to_board, :show_table, :show_players
  attach :before_betting, :ask_for_bet, :ask_for_bet_amount
  attach :after_betting, :show_bet
  attach :after_evaluation, :simulate_evaluating
 
  def set_game_players
    puts "how many players?"
    players_count = gets.chomp.to_i
    players = 0.upto(players_count - 1).map do
      puts "player name:"
      name = gets.chomp
      player = Player.new(name)
    end
    puts "-----------"
    set_players(players)
  end
 
  def show_players
    #add to_s to Player
    @table.players.each do |player|
      puts "#{ player.name }: #{ player.bankroll }"
      player.pocket.each { |card| puts card }
    end
    puts "-----------"
  end
 
  def show_table
    puts "board"
    @table.board.each { |card| puts card }
    puts "-----------"
  end
 
  def ask_for_bet(player)
    puts "#{ player.name }, place your bet, please"
    bet_type = case gets.chomp
                when "r"  then Raise
                when "b"  then Bet
                when "c"  then Call
                when "ch" then Check
                else Fold
                end
    amount = case @bet_type
              when "raise"
                puts "amount of your raise"
                gets.chomp.to_i
              when "bet"
                puts "amount of your bet"
                gets.chomp.to_i
              else
                0
              end
    betting(bet_type, player, amount)
  end
 
  def show_bet(player)
    puts "#{ player.name } #{ @bet_type }s #{@amount_of_bet}"
  end
 
  def simulate_betting
    puts "simulate betting, enter something to continue"
    gets.chomp
    puts "-----------"
  end
 
 
  def simulate_evaluating
    puts "simulate evaluating, enter something to continue"
    gets.chomp
    puts "end of game"
  end
end
 
game = ConsoleClient.new
game.play