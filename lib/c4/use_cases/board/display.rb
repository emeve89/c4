module C4
  module UseCases
    module Board
      class Display
        def self.call(board)
          board.each_with_index do |row, index|
            if index % 9 == 0 && index != 0
              puts ""
              print row
            else
              print row
            end
          end
        end
      end
    end
  end
end