module C4
  module UseCases
    module Game
      class SetUp
        def call
          print "Enter player 1 name: "
          player1_name = gets.strip
          print "Enter player 2 name: "
          player2_name = gets.strip

          players = [
              C4::Entities::Player.new(name: player1_name, symbol: "X"),
              C4::Entities::Player.new(name: player2_name, symbol: "O")
          ]

          return C4::Entities::Game.new(
              players: players
          )
        end
      end
    end
  end
end