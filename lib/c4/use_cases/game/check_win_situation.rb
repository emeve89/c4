module C4
  module UseCases
    module Game
      class CheckWinSituation
        def initialize(player:, board:)
          @player = player
          @board = board
        end

        def call(position:)
          win_position_in_row?(position) or win_position_in_column?(position) or win_position_in_diagonals?(position)
        end

        private

        [:row, :column, :diagonals].each do |type|
          define_method("win_position_in_#{type}?") do |position|
            send("#{type}_to_check", position).send(:map, &get_values).send(:any?, &win_position?)
          end
        end

        def get_values
          lambda do |indexes|
            @board.state.map.with_index do |value, index|
              value if indexes.include?(index)
            end.compact
          end
        end

        def win_position?
          lambda { |values| values.join.include?(@player.symbol * 4) }
        end

        def row_to_check(position)
          @rows_to_check ||= @board.horizontal(position: position)
        end

        def column_to_check(position)
          @columns_to_check ||= @board.vertical(position: position)
        end

        def diagonals_to_check(position)
          @diagonals_to_check ||= @board.diagonals(position: position)
        end
      end
    end
  end
end