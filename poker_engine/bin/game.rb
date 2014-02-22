require_relative "../lib/poker_engine/table.rb"
require_relative "../lib/poker_engine/dealer.rb"
require_relative "../lib/poker_engine/player.rb"
require_relative "../lib/poker_engine/action.rb"
require_relative "../lib/poker_engine/evaluater.rb"
 
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
  Fold, Check, Bet, Call, Raise = 1, 2, 3, 4, 5
  BigBlind = 20;

  def set_players(players)
    players.each { |player| @table.add_player player }
    set_blinds
  end

  def set_blinds  
    @table.rotate_players
    count = @table.players.count
    @table.players[0 % count].buck = true
    amount = @table.players[1 % count].decrease_bankroll(BigBlind / 2)
    amount += @table.players[2 % count].decrease_bankroll(BigBlind)
    @table.pot.blinds_amount += amount
  end
 
  def betting_round
    all_players_called = false
    until all_players_called
      @table.players.select { |player| player.betting_status != Fold }.each do |player|
        before_betting(player)
        after_betting(player)
      end
      all_players_called = @table.pot.all_players_called?
    end
    @table.pot.all_players_called?
  end

  def betting(bet_type, player, amount)
    action = Action.new(@table.pot, @table.players)
    case bet_type
    when Fold then action.fold(player)
    when Check then action.check(player)
    when Bet then action.bet(player, amount)
    when Call then action.call(player)
    when Raise then action.raise(player, amount)
    end
  end
 
  def evaluate
    players_in_game = @table.players.select { |player| player.betting_status != Fold }
    evaluater = Evaluater.new
    @winners = evaluater.find_winners(@table, players_in_game)
  end

  def pay_winners
    @winners.each do |winner|
      winner.increase_bankroll(@table.pot.amount / winners.count)
    end
  end

  def clear_table
    @table.clear_board
    @table.pot.clear
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
  attach :before_betting, :ask_for_bet
  attach :after_betting, :show_bet
  attach :after_evaluation, :show_winners
 
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
      buck = player.buck? ? ", D" : ""
      puts "#{ player.name }: #{ player.bankroll }#{ buck }"
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
    puts "#{ player.name }, choose action, please:"
    bet_type = case gets.chomp
               when "r"  then Raise
               when "b"  then Bet
               when "c"  then Call
               when "ch" then Check
               else
                 puts "enter action again:"
                 gets.chomp
               end
    @amount = case bet_type
              when Raise
                puts "amount of your raise:"
                gets.chomp.to_i
              when Bet
                puts "amount of your bet:"
                gets.chomp.to_i
              else
                0
              end
    betting(bet_type, player, @amount)
  end
 
  def show_bet(player)
    puts "#{ player.name } #{ player.betting_status }s #{ @amount }"
    puts "info*************"
    @table.players.each { |player| puts "#{player.name}: #{player.bankroll}" }
    puts "***********"
  end

  def show_winners
    puts "the winners are:"
    @winners.each { |winner| puts winner.name }
    clear_table
    puts "enter something to continue"
    gets.chomp
  end
end
 
game = ConsoleClient.new
game.play