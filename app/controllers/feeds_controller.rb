class FeedsController < ApplicationController
  def new
  	@feed = Feed.new
  end

  def create
  	@feed = Feed.new(feed_params)
  	if @feed.save
  		flash[:success] = '投稿しました'
  		redirect_to feed_path(@feed.id)
  	else
  		render :new
  	end
  end

  def show
  	@feed = Feed.find(params[:id])
  end

  def index
  	@feeds = Feed.all
  end

  def destroy
  	@feed = Feed.find(params[:id])
  	@feed.destroy
  	flash[:success] = '削除しました'
  	redirect_to feeds_path
  end

  private
  def feed_params
  	params.require(:feed).permit(:image, :image_cache)
  end
end
