# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'likes/show', type: :view do
  before(:each) do
    @like = assign(:like, Like.create!(
                            tweet: nil,
                            user: nil
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
