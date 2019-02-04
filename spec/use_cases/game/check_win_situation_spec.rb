require "spec_helper"

RSpec.describe C4::UseCases::Game::CheckWinSituation do
  describe "#call" do
    let(:board) { C4::Entities::Board.new }
    let(:player) { double("player1", name: "player1", symbol: "X") }
    let(:use_case) { described_class.new(player: player, board: board) }

    context "when the board is empty" do
      it "returns false" do
        expect(use_case.call(position: [1...62].sample)).to eq false
      end
    end

    context "when the board is not empty" do
      it "check win position in rows" do
        index = board.insert_chip(column: 2, piece: "X")
        expect(described_class.new(player: player, board: board).call(position: index)).to eq false
        index = board.insert_chip(column: 3, piece: "X")
        expect(described_class.new(player: player, board: board).call(position: index)).to eq false
        index = board.insert_chip(column: 4, piece: "X")
        expect(described_class.new(player: player, board: board).call(position: index)).to eq false
        index = board.insert_chip(column: 5, piece: "X")
        expect(described_class.new(player: player, board: board).call(position: index)).to eq true

        expect(described_class.new(player: player, board: board).send(:win_position_in_row?, index)).to eq true
        expect(described_class.new(player: player, board: board).send(:win_position_in_column?, index)).to eq false
        expect(described_class.new(player: player, board: board).send(:win_position_in_diagonals?, index)).to eq false
      end

      it "check win position in columns" do
        index = board.insert_chip(column: 2, piece: "X")
        expect(described_class.new(player: player, board: board).call(position: index)).to eq false
        index = board.insert_chip(column: 2, piece: "X")
        expect(described_class.new(player: player, board: board).call(position: index)).to eq false
        index = board.insert_chip(column: 2, piece: "X")
        expect(described_class.new(player: player, board: board).call(position: index)).to eq false
        index = board.insert_chip(column: 2, piece: "X")
        expect(described_class.new(player: player, board: board).call(position: index)).to eq true

        expect(described_class.new(player: player, board: board).send(:win_position_in_row?, index)).to eq false
        expect(described_class.new(player: player, board: board).send(:win_position_in_column?, index)).to eq true
        expect(described_class.new(player: player, board: board).send(:win_position_in_diagonals?, index)).to eq false
      end

      it "check win position in diagonals" do
        index = board.insert_chip(column: 2, piece: "X")
        expect(described_class.new(player: player, board: board).call(position: index)).to eq false
        index = board.insert_chip(column: 3, piece: "O")
        expect(described_class.new(player: player, board: board).call(position: index)).to eq false
        index = board.insert_chip(column: 3, piece: "X")
        expect(described_class.new(player: player, board: board).call(position: index)).to eq false
        index = board.insert_chip(column: 4, piece: "X")
        expect(described_class.new(player: player, board: board).call(position: index)).to eq false
        index = board.insert_chip(column: 4, piece: "O")
        expect(described_class.new(player: player, board: board).call(position: index)).to eq false
        index = board.insert_chip(column: 4, piece: "X")
        expect(described_class.new(player: player, board: board).call(position: index)).to eq false
        index = board.insert_chip(column: 5, piece: "X")
        expect(described_class.new(player: player, board: board).call(position: index)).to eq false
        index = board.insert_chip(column: 5, piece: "O")
        expect(described_class.new(player: player, board: board).call(position: index)).to eq false
        index = board.insert_chip(column: 5, piece: "O")
        expect(described_class.new(player: player, board: board).call(position: index)).to eq false
        index = board.insert_chip(column: 5, piece: "X")
        expect(described_class.new(player: player, board: board).call(position: index)).to eq true

        expect(described_class.new(player: player, board: board).send(:win_position_in_row?, index)).to eq false
        expect(described_class.new(player: player, board: board).send(:win_position_in_column?, index)).to eq false
        expect(described_class.new(player: player, board: board).send(:win_position_in_diagonals?, index)).to eq true
      end
    end
  end
end