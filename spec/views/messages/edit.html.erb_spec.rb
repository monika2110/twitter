require 'rails_helper'

RSpec.describe "messages/edit", type: :view do
  before(:each) do
    @message = assign(:message, Message.create!(
      content: "MyText",
      reserences: ""
    ))
  end

  it "renders the edit message form" do
    render

    assert_select "form[action=?][method=?]", message_path(@message), "post" do

      assert_select "textarea[name=?]", "message[content]"

      assert_select "input[name=?]", "message[reserences]"
    end
  end
end
