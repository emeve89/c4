module C4
  module UseCases
    module Game
      class CheckWinSituation
        def initialize(player:, board:)
          @player = player
          @board = board
        end

        def call(position:)
          win_position_in_row?(position) \
          || win_position_in_column?(position) \
          || win_position_in_diagonals?(position)
        end

        private

        %I[row column diagonals].each do |type|
          define_method("win_position_in_#{type}?") do |position|
            send("#{type}_to_check", position)
              .send(:map, &values)
              .send(:any?, &win_position?)
          end
        end

        def values
          lambda do |indexes|
            @board.state.map.with_index do |value, index|
              value if indexes.include?(index)
            end.compact
          end
        end

        def win_position?
          ->(values) { values.join.include?(@player.symbol * 4) }
        end

        def row_to_check(position)
          @row_to_check ||= @board.horizontal(position)
        end

        def column_to_check(position)
          @column_to_check ||= @board.vertical(position)
        end

        def diagonals_to_check(position)
          @diagonals_to_check ||= @board.diagonals(position)
        end
      end
    end
  end
end
