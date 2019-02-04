require "spec_helper"

RSpec.describe C4::UseCases::Board::Display do
  let(:board) { C4::Entities::Board.new }
  let(:another_state) do
    [
        "|", " ", " ", " ", " ", " ", " ", " ", "|",
        "|", " ", " ", " ", " ", " ", " ", " ", "|",
        "|", " ", " ", " ", " ", " ", " ", " ", "|",
        "|", " ", " ", " ", " ", " ", " ", " ", "|",
        "|", " ", " ", " ", " ", " ", " ", " ", "|",
        "|", " ", " ", " ", " ", " ", " ", " ", "|",
        "|", " ", "X", " ", " ", " ", " ", " ", "|",
        "|", 1, 2, 3, 4, 5, 6, 7, "|"
    ]
  end

  describe ".call" do
    it "prints the state of the board in the console" do
      expect { described_class.call(board.state) }.to output("|       |\n|       |\n|       |\n|       |\n|       |\n|       |\n|       |\n|1234567|").to_stdout
      allow(board).to receive(:state).and_return(another_state)
      expect { described_class.call(board.state) }.to output("|       |\n|       |\n|       |\n|       |\n|       |\n|       |\n| X     |\n|1234567|").to_stdout
    end
  end
end