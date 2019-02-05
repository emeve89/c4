module C4
  module UseCases
    module Player
      class Play
        attr_reader :game

        def self.call(board:, player:)
          loop do
            print "\n\n#{player.name}'s turn"
            print "\nEnter column (1-7): "
            column = gets.strip.to_i
            next unless (1..7).cover?(column)

            index = board.insert_chip(column: column, piece: player.symbol)
            return index
          end
        end
      end
    end
  end
end
