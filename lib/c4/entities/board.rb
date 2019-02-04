module C4
  module Entities
    class Board
      include Utils::Indexes

      def initialize
        @board = [
            "|", " ", " ", " ", " ", " ", " ", " ", "|",
            "|", " ", " ", " ", " ", " ", " ", " ", "|",
            "|", " ", " ", " ", " ", " ", " ", " ", "|",
            "|", " ", " ", " ", " ", " ", " ", " ", "|",
            "|", " ", " ", " ", " ", " ", " ", " ", "|",
            "|", " ", " ", " ", " ", " ", " ", " ", "|",
            "|", " ", " ", " ", " ", " ", " ", " ", "|",
            "|", 1, 2, 3, 4, 5, 6, 7, "|"
        ]
      end

      def state
        @board
      end

      def insert_chip(column:, piece:)
        return false unless there_is_place?(column)
        place_to_insert = column(column).select { |value, _| value == " " }.last
        index = place_to_insert[1]
        @board[index] = piece
        index
      end

      private

      def there_is_place?(column)
        column(column).map { |value, _| value}.include?(" ")
      end

      def column(num)
        @board.each_with_index.select do |value, index|
          value if COLUMNS[num-1].include?(index)
        end
      end
    end
  end
end