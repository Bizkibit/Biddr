class WatchesController < ApplicationController
  before_action :authenticate_user!

  def create

    @auction = Auction.find(params[:auction_id])

    # @watch = current_user.watches.new( auction: @auction)
    @watch = Watch.new(auction: @auction, user: current_user)

    if @watch.save
      flash[:notice] = "Auction being watched"
    else
      flash[:alert] = "Watchable error"
    end
    redirect_to auction_path(@auction)
    # render json:  params
  end

  def destroy
    watch = Watch.find(params[:id])
    if watch.destroy
      flash[:notice] = "Watch removed"
    else
      flash[:alert] = "ErroR!!"
    end
    # redirect_to auction_path(auction)
    redirect_to auction_path(watch.auction)
  end
end
