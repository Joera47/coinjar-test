require "rails_helper"

RSpec.describe PricesController, type: :controller do
  describe "Latest page" do
    before do
      get :latest
    end

    context "retrieve prices from Coinjar API" do
      it "can retrieve latest bitcoin prices" do
        bitcoin_latest = assigns(:bitcoin_latest)
        expect(bitcoin_latest.class).to eq(HTTParty::Response)

        ["ask", "bid", "current_time", "last", "prev_close", "session", "status", "transition_time", "volume", "volume_24h"].each do |key|
          expect(bitcoin_latest).to include(key)
        end
      end

      it "can retrieve latest bitcoin prices" do
        ethereum_latest = assigns(:ethereum_latest)
        expect(ethereum_latest.class).to eq(HTTParty::Response)

        ["ask", "bid", "current_time", "last", "prev_close", "session", "status", "transition_time", "volume", "volume_24h"].each do |key|
          expect(ethereum_latest).to include(key)
        end
      end
    end
  end

  describe "Index page" do
    context "history before first capture" do
      before do
        get :index
      end

      let(:history) { assigns(:history) }

      it "should return an empty array" do
        expect(history).to be_empty
      end

      it "should return a Bitcoin Relation when no " do
        expect(history.class.to_s).to eq("Bitcoin::ActiveRecord_Relation")
      end
    end

    context "history if param type is blank" do
      before do
        @count = rand(1..10)
        @count.times { create :bitcoin, :set_prices }
        get :index
      end

      let(:history) { assigns(:history) }

      it "should return a Bitcoin Relation" do
        expect(history.class.to_s).to eq("Bitcoin::ActiveRecord_Relation")
        expect(history.first.class.to_s).to eq("Bitcoin")
      end

      it "should return a list of Bitcoin instances" do
        expect(Bitcoin.count).to eq (@count)
        expect(history.size).to eq (@count)
      end
    end

    context "history if param type is \"bitcoin\"" do
      before do
        allow(controller).to receive(:params).and_return( {type: "bitcoin"} )
        @count = rand(1..10)
        @count.times { create :bitcoin, :set_prices }
        get :index
      end

      let(:history) { assigns(:history) }

      it "should return a Bitcoin Relation" do
        expect(history.class.to_s).to eq("Bitcoin::ActiveRecord_Relation")
        expect(history.first.class.to_s).to eq("Bitcoin")
      end

      it "should return a list of Bitcoin instances" do
        expect(Bitcoin.count).to eq (@count)
        expect(history.size).to eq (@count)
      end
    end

    context "history if param type is \"ethereum\"" do
      before do
        allow(controller).to receive(:params).and_return( {type: "ethereum"} )
        @count = rand(1..10)
        @count.times { create :ethereum, :set_prices }
        get :index
      end

      let(:history) { assigns(:history) }

      it "should return an Ethereum Relation" do
        expect(history.class.to_s).to eq("Ethereum::ActiveRecord_Relation")
        expect(history.first.class.to_s).to eq("Ethereum")
      end

      it "should return a list of Ethereum instances" do
        expect(Ethereum.count).to eq (@count)
        expect(history.size).to eq (@count)
      end
    end
  end

  describe "Create request" do
    before do
      post :create
    end

    context "retrieve prices from Coinjar API" do
      it "can retrieve latest bitcoin prices" do
        bitcoin_latest = assigns(:bitcoin_latest)
        expect(bitcoin_latest.class).to eq(HTTParty::Response)

        ["ask", "bid", "current_time", "last", "prev_close", "session", "status", "transition_time", "volume", "volume_24h"].each do |key|
          expect(bitcoin_latest).to include(key)
        end
      end

      it "can retrieve latest bitcoin prices" do
        ethereum_latest = assigns(:ethereum_latest)
        expect(ethereum_latest.class).to eq(HTTParty::Response)

        ["ask", "bid", "current_time", "last", "prev_close", "session", "status", "transition_time", "volume", "volume_24h"].each do |key|
          expect(ethereum_latest).to include(key)
        end
      end
    end

    context "create Bitcoin instance" do
      it "can retrieve latest bitcoin prices and save it" do
        bitcoin_latest = assigns(:bitcoin_latest)
        bitcoin_object = Bitcoin.last
        expect(Bitcoin.count).to eq(1)
        expect(bitcoin_object.ask).to eq(bitcoin_latest["ask"].to_f)
        expect(bitcoin_object.bid).to eq(bitcoin_latest["bid"].to_f)
        expect(bitcoin_object.last).to eq(bitcoin_latest["last"].to_f)
      end
    end

    context "create Ethereum instance" do
      it "can retrieve latest ethereum prices and save it" do
        ethereum_latest = assigns(:ethereum_latest)
        ethereum_object = Ethereum.last
        expect(Ethereum.count).to eq(1)
        expect(ethereum_object.ask).to eq(ethereum_latest["ask"].to_f)
        expect(ethereum_object.bid).to eq(ethereum_latest["bid"].to_f)
        expect(ethereum_object.last).to eq(ethereum_latest["last"].to_f)
      end
    end
  end
end