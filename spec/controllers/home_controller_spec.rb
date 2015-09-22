require 'spec_helper'
require 'rails_helper'

RSpec.describe HomeController, :type => :controller do
  describe "get_tweets" do
    before(:each) do
      @user = FactoryGirl.create(:user, email: 'test@test.com')
      sign_in @user
      controller.stub(:API_user_timeline).and_return([{text: 'fake tweet'}, {text: 'other tweet'}])
    end

    it "should hit API only one time" do
      Rails.cache.clear # clear cache so we can actually hit the stubbed method
      params = {
        handle: 'samcarow'
      }
      controller.should_receive(:API_user_timeline).once
      post :get_tweets, params
    end

    it "should cache a response" do
      Rails.cache.clear
      params = {
        handle: 'samcarow'
      }
      controller.should_receive(:API_user_timeline).once
      post :get_tweets, params
      expect(Rails.cache.exist?('samcarow')).to be(true)
    end

    it "should render index" do
      params = {
        handle: 'samcarow'
      }
      post :get_tweets, params
      expect(subject).to render_template(:index)
    end

    it "should not raise error on API failure" do
      Rails.cache.clear
      controller.stub(:API_user_timeline).and_raise(StandardError.new("error"))
      params = {
        handle: 'samcarow'
      }
      post :get_tweets, params
      expect(response.status).to eql(200)
    end
  end

end
