require_relative "../lib/poker_engine/table.rb"
require_relative "../lib/poker_engine/dealer.rb"
require_relative "../lib/poker_engine/player.rb"

class Game
  def set_players(table)
    puts "how many players?"
    players_count = gets.chomp

    players_count.to_i.times do
      puts "player name:"
      name = gets.chomp
      player = Player.new(name)
      table.add_player(player)
    end
    puts "-----------"
  end

  def show_players(table)
    #add to_s to Player
    table.players.each do |player|
      puts player.name
      player.pocket.each { |card| puts card }
    end
    puts "-----------"
  end

  def show_table(table)
    puts "board"
    table.board.each { |card| puts card }
    puts "-----------"
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

  def betting(table)
    table.players.each do |player|
      puts player.name + " should bet"
      betting_type =
        case gets.chomp
        when "r" then "raise"
        when "b" then "bet"
        when "c" then "call"
        when "ch" then "check"
        when "f" then "fold"
        else "fold"
        end
      puts player.name + " " + betting_type
    end
  end

  def play
  	table = Table.new
    dealer = Dealer.new(table)

    set_players(table)

    dealer.deal_to_players
    show_players(table)
    
    betting(table)
 
    dealer.deal_to_board(3) # flop
    show_table(table)
    show_players(table)
    
    betting(table)
 
    dealer.deal_to_board(1) # turn
    show_table(table)
    show_players(table)
    
    betting(table)
    
    dealer.deal_to_board(1) # river
    show_table(table)
    show_players(table)
    
    betting(table)

    simulate_evaluating
  end
end

game = Game.new
game.play