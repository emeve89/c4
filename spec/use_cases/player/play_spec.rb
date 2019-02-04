require "spec_helper"

RSpec.describe C4::UseCases::Player::Play do
  describe ".call" do
    before do
      allow(C4::UseCases::Player::Play).to receive_message_chain(:gets, :strip, :to_i).and_return(column)
    end

    let(:index) { 56 }
    let(:column) { 3 }
    let(:board) { double("board", insert_chip: index) }
    let(:player) { double("player", name: "Mario", symbol: "X")}

    it "prints who should play and the numbers allowed (columns)" do
      expect { C4::UseCases::Player::Play.call(player: player, board: board) }.to output("\n\n#{player.name}'s turn\nEnter column (1-7): ").to_stdout
    end

    it "class insert_chip on C4::Entities::Board object" do
      expect(board).to receive(:insert_chip).with(column: column, piece: player.symbol).once
      C4::UseCases::Player::Play.call(player: player, board: board)
    end

    it "returns the index (Integer) where the piece was dropped" do
      expect(C4::UseCases::Player::Play.call(player: player, board: board)).to eq index
      expect(C4::UseCases::Player::Play.call(player: player, board: board).class).to eq Integer
    end
  end
end