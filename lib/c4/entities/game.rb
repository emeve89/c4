module C4
  module Entities
    class Game
      def initialize(players:)
        @player1 = players.first
        @player2 = players.last
        @current_player = @player1
        @board = C4::Entities::Board.new
      end

      def run
        loop do
          C4::UseCases::Board::Display.call(@board.state)
          position = player_play
          player_won = player_won?(position)
          display_message_and_board && break if player_won
          switch_player
          system 'clear' or system 'cls'
        end
      end

      private

      def player_play
        C4::UseCases::Player::Play.call(player: @current_player, board: @board)
      end

      def player_won?(position)
        C4::UseCases::Game::CheckWinSituation
          .new(player: @current_player, board: @board)
          .call(position: position)
      end

      def display_message_and_board
        puts "#{@current_player.name} won"
        C4::UseCases::Board::Display.call(@board.state)
      end

      def switch_player
        @current_player = if @current_player == @player1
                            @player2
                          else
                            @player1
                          end
      end
    end
  end
end
