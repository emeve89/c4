require "spec_helper"

RSpec.describe C4::Entities::Player do
  describe "attributes" do
    let(:player) { described_class.new(name: "Name", symbol: "X") }
    it "responds to name" do
      expect(player.name).to eq "Name"
    end

    it "responds to symbol" do
      expect(player.symbol).to eq "X"
    end
  end
end