class PricesController < ApplicationController
  def latest
    @bitcoin_latest   = HTTParty.get("https://data.exchange.coinjar.com/products/BTCAUD/ticker")
    @ethereum_latest  = HTTParty.get("https://data.exchange.coinjar.com/products/ETHAUD/ticker")
  end

  def index



    # @response["ask"]
    # @response["bid"]
    # @response["last"]
  end


  def create

  end
end