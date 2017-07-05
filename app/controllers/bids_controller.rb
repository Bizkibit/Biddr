class BidsController < ApplicationController
before_action :authenticate_user!, except:[:index, :show]

  def create
    @bid = Bid.new bid_params
    @auction = Auction.find params[:auction_id]
    if @auction.bids.present?
      @current_price = @auction.bids.order(price: :desc).first.price
    else
      @current_price = 1
    end
    if @bid.price > @current_price
      @bid.auction = @auction
      @bid.user = current_user
      if !(cannot? :create, @bid)
        if @bid.save
          flash[:notice] = "Bid created"
          redirect_to auction_path(@auction)

        else
          render "auctions/show"
        end
      else
        head :unauthorized
      end
    else
      flash[:alert] = "Bid is lower than current price "
      redirect_to auction_path(@auction)
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:price)
  end
end
