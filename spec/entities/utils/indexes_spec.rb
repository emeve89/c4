require "spec_helper"

RSpec.describe C4::Entities::Utils::Indexes do
  it "defines index lists" do
    expect(C4::Entities::Utils::Indexes::COLUMNS.class).to eq Array
    expect(C4::Entities::Utils::Indexes::ROWS.class).to eq Array
    expect(C4::Entities::Utils::Indexes::DIAGONALS.class).to eq Array

    expect(C4::Entities::Utils::Indexes::COLUMNS.map(&:class).uniq).to eq [Array]
    expect(C4::Entities::Utils::Indexes::ROWS.map(&:class).uniq).to eq [Array]
    expect(C4::Entities::Utils::Indexes::DIAGONALS.map(&:class).uniq).to eq [Array]

    expect(C4::Entities::Utils::Indexes::COLUMNS.flatten.map(&:class).uniq).to eq [Integer]
    expect(C4::Entities::Utils::Indexes::ROWS.flatten.map(&:class).uniq).to eq [Integer]
    expect(C4::Entities::Utils::Indexes::DIAGONALS.flatten.map(&:class).uniq).to eq [Integer]
  end
end