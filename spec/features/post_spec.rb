require 'rails_helper'

describe 'new post' do
  before(:each) do
    visit new_post_path
  end
  it 'ensures that the /new route works' do
    expect(page.status_code).to eq(200)
  end

  it 'renders HTML in the /new page' do
    expect(page).to have_content('Post Form')
  end

  it "displays a new post form that redirects to the index page, which then contains the submitted post's title and description" do
    fill_in 'post_title', with: 'My post title'
    fill_in 'post_description', with: 'My post description'

    click_on 'Submit Post'

    expect(page.current_path).to eq(posts_path)
    expect(page).to have_content('My post title')
    assert_text 'My post description'
  end
end