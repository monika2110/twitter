# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'user model validation' do
    it 'must have name' do
      user = User.new(username: 'user', email: 'user@example.com', password: 'password',
                      password_confirmation: 'password')
      expect(user).to_not be_valid
    end
  end
end
