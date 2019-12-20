require 'rails_helper'

RSpec.describe Ethereum, type: :model do
  it "has the appropriate columns" do
    ["id", "ask", "bid", "last", "created_at", "updated_at"].each do |column_names|
      expect(Ethereum.column_names).to include(column_names)
    end
  end

  it "should create the an instance on every request" do
    rand(10).times do |i|
      create :ethereum, :set_prices
      expect(Ethereum.count).to eq i + 1
    end
  end

  it "should create an instance in the appropriate range (set by factory)" do
    5.times do
      create :ethereum, :set_prices
      ethereum = Ethereum.last
      expect(ethereum.ask).to be_between(100, 300)
      expect(ethereum.bid).to be_between(100, 300)
      expect(ethereum.last).to be_between(100, 300)
    end
  end
end