# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'retweets/show', type: :view do
  before(:each) do
    @retweet = assign(:retweet, Retweet.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
