# rubocop:disable all

require 'rails_helper'

RSpec.describe Relation, type: :model do
  current_user = User.first_or_create!(name: 'user', username: 'user', email: 'user@example.com', password: 'password',
                                       password_confirmation: 'password')
  other_user = User.first_or_create!(name: 'user2', username: 'user2', email: 'user2@example.com', password: 'password',
                                     password_confirmation: 'password')
  it 'must be unique' do
    first_relation = Relation.create(
      follower: current_user,
      followee: other_user
    )
    expect(first_relation).to be_valid

    second_relation = Relation.create(
      follower: current_user,
      followee: other_user
    )
    expect(second_relation).to_not be_valid
  end

  it 'has a follower' do
    relation = Relation.create(
      followee: other_user
    )
    expect(relation).to_not be_valid

    relation.follower_id = current_user.id
    expect(relation).to be_valid
  end

  it 'has a followee' do
    relation = Relation.create(
      follower: current_user
    )
    expect(relation).to_not be_valid

    relation.followee_id = other_user.id
    expect(relation).to be_valid
  end
end
