class PublishingsController < ApplicationController
  before_action :authenticate_user!


  def create
      @auction = Auction.find(params[:auction_id])
      if !@auction.published?
        @auction.publish
        if @auction.save
          @auction.save
          flash[:notice] = "auction published"
        else
          flash[:alert] = "Publshing Error"
        end
      else
        flash[:alert] = "auction already published"
      end
      redirect_to auction_path(@auction)
  end
  
end
