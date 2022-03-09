require 'rails_helper'

RSpec.describe "/tweets", type: :request do
  current_user = User.first_or_create!(name: 'user', username: 'user', email: 'user@example.com', password: 'password',
                                       password_confirmation: 'password')
  let(:valid_attributes) do {
    'id' => '1',
    'content' => 'content',
    'user' => current_user
  }
  end
  describe "GET /index" do
    it "renders a successful response" do
      tweet = Tweet.new(valid_attributes)
      tweet.user = current_user
      tweet.save
      get tweets_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      tweet = Tweet.new(valid_attributes)
      tweet.user = current_user
      tweet.save
      get tweet_url(tweet)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do

      get new_tweet_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      tweet = Tweet.new(valid_attributes)
      tweet.user = current_user
      tweet.save
      get edit_tweet_url(tweet)
      expect(response).to be_successful
    end
  end
end
