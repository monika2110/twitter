# rubocop:disable all

require 'rails_helper'

RSpec.describe Notification, type: :model do
  current_user = User.first_or_create!(name: 'user', username: 'user', email: 'user@example.com', password: 'password',
                                       password_confirmation: 'password')
  other_user = User.first_or_create!(name: 'user2', username: 'user2', email: 'user2@example.com', password: 'password',
                                     password_confirmation: 'password')
  tweet = Tweet.first_or_create!(content: 'content', user: other_user)
  it 'has source' do
    notification = Notification.new(
      sender_id: current_user.id,
      recipient_id: other_user.id
    )
    expect(notification).to_not be_valid

    notification.source = tweet
    expect(notification).to be_valid
  end

  it 'sender' do
    notification = Notification.new(
      recipient_id: other_user.id,
      source: tweet
    )
    expect(notification).to_not be_valid

    notification.sender = current_user
    expect(notification).to be_valid
  end

  it 'recipient' do
    notification = Notification.new(
      sender_id: current_user.id,
      source: tweet
    )
    expect(notification).to_not be_valid

    notification.recipient = other_user
    expect(notification).to be_valid
  end
end
