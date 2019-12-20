require 'rails_helper'

RSpec.describe Bitcoin, type: :model do
  it "has the appropriate columns" do
    ["id", "ask", "bid", "last", "created_at", "updated_at"].each do |column_names|
      expect(Bitcoin.column_names).to include(column_names)
    end
  end

  it "should create the an instance on every request" do
    rand(10).times do |i|
      create :bitcoin, :set_prices
      expect(Bitcoin.count).to eq i + 1
    end
  end

  it "should create an instance in the appropriate range (set by factory)" do
    5.times do
      create :bitcoin, :set_prices
      bitcoin = Bitcoin.last
      expect(bitcoin.ask).to be_between(9000, 12000)
      expect(bitcoin.bid).to be_between(9000, 12000)
      expect(bitcoin.last).to be_between(9000, 12000)
    end
  end
end