class HomeController < ApplicationController

  def initialize
    @tweets = []
    super
  end

  def index
  end

  def get_tweets
    handle = params[:handle]
    begin
      @tweets = Rails.cache.fetch("#{handle}", expires_in: 5.minutes) do
        $client.user_timeline(handle, count: 25)
      end
    rescue Exception => e
      flash.now[:error] = e.message
    end

    render 'index'
  end
end