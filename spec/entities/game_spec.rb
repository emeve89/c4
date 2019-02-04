require "spec_helper"

RSpec.describe C4::Entities::Game do
  let(:players) do
    [
        double("player1", name: "player1", piece: "X"),
        double("player2", name: "player2", piece: "O")
    ]
  end
  let(:game) { described_class.new(players: players) }

  describe "#call" do

    before do
      allow(game).to receive(:loop).and_yield
      allow(game).to receive(:system)
    end

    it "C4::UseCases::Board::Display gets called" do
      expect(C4::UseCases::Board::Display).to receive(:call)
      allow(C4::UseCases::Player::Play).to receive(:call)
      allow(C4::UseCases::Game::CheckWinSituation).to receive_message_chain(:new, :call)
      game.run
    end

    it "C4::UseCases::Player::Play gets called" do
      allow(C4::UseCases::Board::Display).to receive(:call)
      expect(C4::UseCases::Player::Play).to receive(:call)
      allow(C4::UseCases::Game::CheckWinSituation).to receive_message_chain(:new, :call)
      game.run
    end

    it "C4::UseCases::Game::CheckWinSituation gets called" do
      allow(C4::UseCases::Board::Display).to receive(:call)
      allow(C4::UseCases::Player::Play).to receive(:call)
      expect(C4::UseCases::Game::CheckWinSituation).to receive_message_chain(:new, :call)
      game.run
    end

    it "current player is updated" do
      allow(C4::UseCases::Board::Display).to receive(:call)
      allow(C4::UseCases::Player::Play).to receive(:call)
      allow(C4::UseCases::Game::CheckWinSituation).to receive_message_chain(:new, :call)
      expect(game.instance_variable_get(:@current_player).name).to eq "player1"
      game.run
      expect(game.instance_variable_get(:@current_player).name).to eq "player2"
    end

    it "system 'clear' gets called" do
      allow(C4::UseCases::Board::Display).to receive(:call)
      allow(C4::UseCases::Player::Play).to receive(:call)
      allow(C4::UseCases::Game::CheckWinSituation).to receive_message_chain(:new, :call)
      expect(game).to receive(:system)
      game.run
    end

    context "if player won" do
      it "a message is displayed" do
        allow(C4::UseCases::Board::Display).to receive(:call)
        allow(C4::UseCases::Player::Play).to receive(:call)
        allow(C4::UseCases::Game::CheckWinSituation).to receive_message_chain(:new, :call).and_return(true)
        expect(game).to receive(:puts)
        game.run
      end

      it "C4::UseCases::Board::Display gets called" do
        allow(C4::UseCases::Player::Play).to receive(:call)
        allow(C4::UseCases::Game::CheckWinSituation).to receive_message_chain(:new, :call).and_return(true)
        expect(C4::UseCases::Board::Display).to receive(:call).twice
        game.run
      end
    end
  end
end