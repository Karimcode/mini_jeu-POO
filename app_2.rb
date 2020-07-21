require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"

puts "Comment t'appelles-tu ?"

name = gets.chomp

player_user = HumanPlayer.new(name)

player1 = Player.new("Josiane")
player2 = Player.new("José")

enemies = [player1, player2]

while player_user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)

puts "--------------------------------
                                       "

puts "Quelle action veux-tu effectuer ?

a - chercher une meilleure arme
s - chercher à se soigner

Attaquer un joueur en vue :
0 - #{player1.show_state}
1 - #{player2.show_state}
                          "

action = gets.chomp

  case action
      when "a"
        player_user.search_weapon
      when "s"
        player_user.search_health_pack
      when "0"
          player_user.attacks(player1)
      when "1"
          player_user.attacks(player2)
      else
        puts "Ca ne veut rien dire..."
  end

puts "Les autres joueurs t'attaquent !"

  enemies.each do |player|
    if player.life_points >0
    player.attacks(player_user)
    end
  end


end

puts "La partie est finie"

if player_user.life_points < 0
  puts "Loser ! Tu as perdu !"
else
  puts "BRAVO ! TU AS GAGNE !"
end

binding.pry
