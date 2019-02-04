module C4
  module Entities
    module Utils
      module Indexes
        DIAGONALS = [
            [4, 12, 20, 28],
            [13, 21, 29, 37],
            [5, 13, 21, 29],
            [46, 38, 30, 22],
            [38, 30, 22, 14],
            [30, 22, 14,6],
            [55, 47, 39, 31],
            [47, 39, 31, 23],
            [39, 31, 23, 15],
            [31, 23, 15, 7],
            [56, 48, 40, 32],
            [48, 40, 32, 24],
            [40, 32, 24, 16],
            [57, 49, 41, 33],
            [49, 41, 33, 25],
            [58, 50, 42, 34],
            [4, 14, 24, 34],
            [3, 13, 23, 33],
            [13, 23, 33, 43],
            [2, 12, 22, 32],
            [12, 22, 32, 42],
            [22, 32, 42, 52],
            [1, 11, 21, 31],
            [11, 21, 31, 41],
            [21, 31, 41, 51],
            [31, 41, 51, 61],
            [10, 20, 30, 40],
            [20, 30, 40, 50],
            [30, 40, 50, 60],
            [19, 29, 39, 49],
            [29, 39, 49, 59],
            [28, 38, 48, 58]
        ]

        COLUMNS = [
            [1, 10, 19, 28, 37, 46, 55],
            [2, 11, 20, 29, 38, 47, 56],
            [3, 12, 21, 30, 39, 48, 57],
            [4, 13, 22, 31, 40, 49, 58],
            [5, 14, 23, 32, 41, 50, 59],
            [6, 15, 24, 33, 42, 51, 60],
            [7, 16, 25, 34, 43, 52, 61]
        ]

        ROWS = [
            [1, 2, 3, 4, 5, 6, 7],
            [10, 11, 12, 13, 14, 15, 16],
            [19, 20, 21, 22, 23, 24, 25],
            [28, 29, 30, 31, 32, 33, 34],
            [37, 38, 39, 40, 41, 42, 43],
            [46, 47, 48, 49, 50, 51, 52],
            [55, 56, 57, 58, 59, 60, 61]
        ]

        #TODO: reduce to one declaraton with metaprogramming
        def horizontal(position:)
          ROWS.select { |row| row.include?(position) }
        end

        def vertical(position:)
          COLUMNS.select { |column| column.include?(position) }
        end

        def diagonals(position:)
          DIAGONALS.select { |diagonal| diagonal.include?(position) }
        end
      end
    end
  end
end