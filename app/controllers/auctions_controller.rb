class AuctionsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]

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
    @watch = @auction.watches.find_by(user: current_user)
    @bids = @auction.bids.order(price: :desc)
    if @bids.present?
     @current_price = @bids.first.price
    else
      @current_price = 1
    end
    @bid = Bid.new
  end

  def index
    if params.has_key? :user_id
      @user = User.find params[:user_id]
      @auctions = @user.watched_auctions
    else
      @auctions = Auction.where(aasm_state: 'published')
      # @auctions = Auction.all
    end
  end

  private

  def auction_params
    params.require(:auction).permit([:title, :detail, :end_on, :reserve_price])
  end
end
