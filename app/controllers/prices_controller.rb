class PricesController < ApplicationController
  def latest
    @bitcoin_latest   = HTTParty.get("https://data.exchange.coinjar.com/products/BTCAUD/ticker")
    @ethereum_latest  = HTTParty.get("https://data.exchange.coinjar.com/products/ETHAUD/ticker")
  end

  def index
    case params[:type]
    when "ethereum"
      @history = Ethereum.all.order(id: :desc)
    else
      @history = Bitcoin.all.order(id: :desc)
    end
  end

  def create
    @bitcoin_latest   = HTTParty.get("https://data.exchange.coinjar.com/products/BTCAUD/ticker")
    @ethereum_latest  = HTTParty.get("https://data.exchange.coinjar.com/products/ETHAUD/ticker")
    Bitcoin.create(@bitcoin_latest.slice("ask", "bid", "last"))
    Ethereum.create(@ethereum_latest.slice("ask", "bid", "last"))
    redirect_to latest_prices_path, notice: "Prices refreshed & captured"
  end
end