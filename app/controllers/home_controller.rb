class HomeController < ApplicationController

  def index
    @tweets = [];
  end

  def get_tweets
    # return error if no handle
    handle = params[:handle]
    @tweets = $client.user_timeline(handle, count: 25)
    render 'index'
  end
end