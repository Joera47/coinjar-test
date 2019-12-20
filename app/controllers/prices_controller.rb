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

    if @history.present?
      @chart_data = [
        {name: "ask", data: @history.map {|crypto| [crypto.created_at, crypto.ask]}.to_h},
        {name: "bid", data: @history.map {|crypto| [crypto.created_at, crypto.bid]}.to_h},
        {name: "last", data: @history.map {|crypto| [crypto.created_at, crypto.last]}.to_h}
      ]

      all_values  = @history.map.map {|crypto| [crypto.ask, crypto.bid, crypto.last]}.flatten
      @min        = all_values.min - 10
      @max        = all_values.max + 10
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