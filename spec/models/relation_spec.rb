require 'rails_helper'

RSpec.describe Relation, type: :model do
  current_user = User.first_or_create!(name:'user', username: 'user', email: 'user@example.com', password: 'password', password_confirmation: 'password')
  other_user= User.first_or_create!(name:'user2', username: 'user2', email: 'user2@example.com', password: 'password', password_confirmation: 'password')
  it 'must be unique' do
    relation = Relation.new(
      follower: current_user,
      followee: other_user
    )

    expect(relation).to be_valid

  end



end
