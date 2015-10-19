require_relative 'deck'

class Game

end

attr_accessor :player_hand, :computer_hand, :deck

  def initialize
    self.deck = deck.new
    end 
    
    def play
      puts "Let's play the exciting game of Blackjack! Hit [enter] to draw cards"
      STDIN.gets
      
      setup_game
      unless blackjack!(computer_hand)
      player_turn
      computer_turn
    end
    
    determine_winner
    ask_to_play_again
  end
  

def dealer_round
    if player_one.deck.cards.empty? != true
    $player_two_card1 = player_one.draw.value
    $player_two_card2 = player_one.draw.value
    $player_two_cards = $player_two_card1 + $player_two_card2
    if $player_two_cards < 16
      $player_two_cards = $player_two_cards + player_one.draw.value
    end
  end
end

    def player_one_hand
        $player_one_card1 = player_one.draw.value
        $player_one_card2 = player_one.draw.value
        $player_one_cards = $player_one_card1 + $player_one_card2
    end

    def play
      player_one_hand
      puts "Press [enter] to get started ..."
      STDIN.gets
      until $player_one_cards >= 21 || $player_two_cards >= 16
        dealer_round
      end
      puts "You have been dealt a #{$player_one_card1} and a #{$player_one_card2}... for a total of #{$player_one_card1 + $player_one_card2}"
      until $answer == "stay" || $player_one_cards >= 21
          puts "Would you like to Hit or Stay?"
          puts "The dealer is showing #{$player_two_card1}"
          puts ""
          $answer = gets.chomp.downcase

        if $answer == "hit"
          $player_one_cards = $player_one_cards + $player_one_card1
          puts "You drew a #{$player_one_card1} for a total of #{$player_one_cards}..."
          elsif $answer == "stay"
          puts "You stayed with #{$player_one_cards}..."
        end
      end
      if $player_one_cards > $player_two_cards && $player_one_cards <= 21
        puts "You won, the computer had #{$player_two_cards}"
      elsif $player_two_cards > $player_one_cards && $player_two_cards <= 21
        puts "Computer won with #{$player_two_cards}"
      elsif $player_one_cards > 21
        puts "Busted!!!!"
      elsif $player_two_cards > 21 && $player_one_cards <=21
        puts "You win, the computer busted..."
      else
        puts "Tie!!!"
    end
    puts "Next Hand? Press [ENTER]..."
    input = gets.chomp.downcase
    if input != "~"
      $player_one_cards = 0
      $player_two_cards = 0
      play
    else
      exit
    end
  end


  def refresh_decks
    if player_one.deck.cards.empty?
      player_one.deck.cards = player_one.winnings.shuffle
      player_one.winnings = []
    end

    if player_two.deck.cards.empty?
      player_two.deck.cards = player_two.winnings.shuffle
      player_two.winnings = []
    end
  end

end



Game.new.play
