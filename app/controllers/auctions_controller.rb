class AuctionsController < ApplicationController
  def create
    @auction = Auction.new auction_params
    @auction.user = current_user
    if @auction.save
      redirect_to(auction_path(@auction))
    else
      render :new
    end
  end

  def new
    @auction = Auction.new
  end

  def show
    @auction = Auction.find(params[:id])
    @bid = Bid.new
  end

  def index
    @auctions = Auction.all
  end

  private

  def auction_params
    params.require(:auction).permit([:title, :detail, :end_on, :reserve_price])
  end
end
