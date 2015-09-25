class HomeController < ApplicationController

  def initialize
    @tweets = []
    super
  end

  def index
  end

  def get_tweets
    handle = params[:handle]
    count = 25
    begin
      @tweets = Rails.cache.fetch("#{handle}", expires_in: 5.minutes) do
        API_user_timeline(handle, count)
      end
    rescue => e
      flash.now[:error] = e.message
    end

    render 'index'
  end

  def API_user_timeline(handle, count)
    $client.user_timeline(handle, count: 25)
  end
end