require 'spec_helper'
require 'rails_helper'

RSpec.describe HomeController, :type => :controller do
  describe "get_tweets" do
    before(:each) do
      @user = FactoryGirl.create(:user, email: 'test@test.com')
      sign_in @user
      stub_request(:any, "https://api.twitter.com/1.1/statuses/user_timeline.json?count=25&screen_name=samcarow").to_return(:body => 'test', :status => 200, :headers => {})
    end

    it "should hit API only one time" do
      params = {
        handle: 'samcarow'
      }
      post :get_tweets, params
      ap response
      # expect(response).to be_an_instance_of(String)
    end

    it "should render index" do
    end

    it "should do error message if API returns error" do
    end
  end

end
