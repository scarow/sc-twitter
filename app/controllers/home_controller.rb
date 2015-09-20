class HomeController < ApplicationController

  def initialize
    @tweets = []
  end

  def index
  end

  def get_tweets
    handle = params[:handle]
    begin
      @tweets = $client.user_timeline(handle, count: 25)
    rescue Exception => e
      flash.now[:error] = e.message
    end

    render 'index'
  end
end