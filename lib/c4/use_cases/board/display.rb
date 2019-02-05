module C4
  module UseCases
    module Board
      class Display
        def self.call(board)
          board.each_with_index do |row, index|
            puts '' if (index % 9).zero? && index != 0
            print row
          end
        end
      end
    end
  end
end
