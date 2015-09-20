class HomeController < ApplicationController

  def index
    @tweets = [];
  end

  def get_tweets
    # return error if no handle
    handle = params[:handle]
    @tweets = []
    begin
      @tweets = $client.user_timeline(handle, count: 25)
    rescue Exception => e
      flash[:error] = e.message
    end

    render 'index'
  end
end