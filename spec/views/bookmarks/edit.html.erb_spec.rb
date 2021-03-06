# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bookmarks/edit', type: :view do
  before(:each) do
    @bookmark = assign(:bookmark, Bookmark.create!)
  end

  it 'renders the edit bookmark form' do
    render

    assert_select 'form[action=?][method=?]', bookmark_path(@bookmark), 'post' do
    end
  end
end
