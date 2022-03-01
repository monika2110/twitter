require 'rails_helper'

RSpec.describe User, type: :model do
  context 'user model validation' do
    it 'must have name' do
      user = User.new(username: 'user', email: 'user@example.com', password: 'password')
      expect(user). to eq(false)
    end

  end

end
