require 'rails_helper'

RSpec.describe "retweets/edit", type: :view do
  before(:each) do
    @retweet = assign(:retweet, Retweet.create!())
  end

  it "renders the edit retweet form" do
    render

    assert_select "form[action=?][method=?]", retweet_path(@retweet), "post" do
    end
  end
end
