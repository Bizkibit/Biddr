class BidsController < ApplicationController
  def create
    @bid = Bid.new bid_params
    @auction = Auction.find params[:auction_id]
    @bid.auction = @auction
    @bid.user = current_user
    if @bid.save
      flash[:notice] = "Bid created"
      redirect_to auction_path(@auction)

    else
      render "auctions/show"
    end

  end

  private

  def bid_params
    params.require(:bid).permit(:price)
  end
end
