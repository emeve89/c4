require "spec_helper"

RSpec.describe C4::Entities::Board do
  let(:board) { described_class.new }

  describe "#state" do
    let(:default_state) do
      [
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

    let(:modified_state) do
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

    it "returns the current state of the board" do
      expect(board.state).to eq(default_state)
      board.insert_chip(column: 2, piece: "X")
      expect(board.state).to eq(modified_state)
    end
  end

  describe "#insert_chip" do
    context "there is no place" do
      it "returns false" do
        7.times { board.insert_chip(column: 2, piece: ["X", "O"].sample) }
        expect(board.insert_chip(column:2, piece: "X")).to eq false
      end
    end

    context "there is place" do
      it "returns de index where the piece was dropped" do
        index = board.insert_chip(column: 3, piece: ["X", "O"].sample)
        expect(index).to eq 57

        index = board.insert_chip(column: 5, piece: ["X", "O"].sample)
        expect(index).to eq 59

        index = board.insert_chip(column: 3, piece: ["X", "O"].sample)
        expect(index).to eq 48
      end
    end
  end
end