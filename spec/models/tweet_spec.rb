require 'rails_helper'

RSpec.describe Tweet, type: :model do
  current_user = User.first_or_create!(name:'user', username: 'user', email: 'user@example.com', password: 'password', password_confirmation: 'password')
  it 'has content' do
    tweet = Tweet.new(
      content: '',
      user: current_user
    )

    expect(tweet).to_not be_valid

    tweet.content = 'content'
    expect(tweet).to be_valid

  end

  it 'has maximum 280 characters' do
    tweet = Tweet.new(
      content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc nisl est, tempus eu ullamcorper vitae, scelerisque sit amet nunc. Donec tincidunt nisi justo, et convallis enim feugiat ac. Nam non condimentum mi, eget suscipit magna. Quisque commodo turpis eu est lacinia, nec suscipit purus pulvinar. Quisque ut convallis erat, id pulvinar ante. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam ac eros purus. Sed ipsum mi, lobortis eget vehicula at, dictum eget sapien.',
      user: current_user
    )

    expect(tweet).to_not be_valid

    tweet.content = 'content'
    expect(tweet).to be_valid
  end


  it 'must have a user' do

  tweet = Tweet.new(
    content: 'content',
  )

  expect(tweet).to_not be_valid

  tweet.user = current_user
  expect(tweet).to be_valid


  end

end