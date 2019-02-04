require "spec_helper"

RSpec.describe C4::UseCases::Game::SetUp do
  describe ".call" do
    let(:use_case) { described_class.new }

    before do
      allow(use_case).to receive_message_chain(:gets, :strip).and_return("P1")
    end

    it "asks for player name" do
      expect { use_case.call }.to output("Enter player 1 name: Enter player 2 name: ").to_stdout
    end

    it "returns a C4::Entities::Game instance" do
      expect(use_case.call.class).to eq C4::Entities::Game
    end
  end
end