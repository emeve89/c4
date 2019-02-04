module C4
  module Entities
    class Game
      def initialize(players:)
        @player_1 = players.first
        @player_2 = players.last
        @current_player = @player_1
        @board = C4::Entities::Board.new
      end

      def run
        loop do
          C4::UseCases::Board::Display.call(@board.state)
          position = C4::UseCases::Player::Play.call(player: @current_player, board: @board)
          player_won = C4::UseCases::Game::CheckWinSituation.new(player: @current_player, board: @board).call(position: position)
          if player_won
            puts "#{@current_player.name} won"
            C4::UseCases::Board::Display.call(@board.state)
            break
          end
          @current_player = (@current_player == @player_1) ? @player_2 : @player_1
          system "clear" or system "cls"
        end
      end
    end
  end
end