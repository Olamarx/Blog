require 'rails_helper'
require 'helpers/posts_helper_spec.rb'
require 'helpers/users_helper_spec.rb'
require 'helpers/comments_helper_spec.rb'

RSpec.describe 'Post', type: :feature do
    before(:each) do
    @name = 'user'
      @user = create_user(@name)
      @posts = create_posts_for_user(@user, count: 5)
      @comments = create_comments_by_user(@user, @posts.first, count: 3)
      visit user_posts_path(@user)
    end
    
it 'The photo should be seen' do
    expect(page).to have_css("img[src*='photo-url']")
end
it 'The username should be seen' do
    expect(page).to have_content @name
end
it "Should return the corect number of the users posts" do 
    expect(page).to have_content 'Number of posts: 5'
    expect(@user.posts_counter).to be 5
  end

  it "Show user post\'s title" do
    expect(page).to have_content @posts.first.title
  end
end
