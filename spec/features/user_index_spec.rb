require 'rails_helper'
require 'helpers/users_helper_spec'

RSpec.describe 'Users', type: :feature do
  context 'user index page' do
    before(:each) do
      @user = User.create(name: 'Owoeye', bio: 'Teacher from Poland.', photo: 'https://github.com/masangana/blog/blob/ff0fc0a1396204b7be88769e650aa1a3dfee29b4/app/assets/images/2.jpg')
      @user.save
    end
    it 'should show username of users' do
      visit root_path
      expect(page).to have_content(@user.name)
    end

    it 'should show image of users' do
      visit root_path
      expect(page).to have_css("img[src='#{@user.photo}']")
    end

    it 'should show number of posts of users' do
      visit root_path
      expect(page).to have_content(@user.posts_counter)
    end

    it 'should show number of posts of users' do
      @user.posts_counter = 1
      [@user].each(&:save)
      visit users_path
      expect(page).to have_content 'Number of posts: 1' 
    end

    it 'should click open profile button and redirect to that user show page' do
      click_link @user.name
      expect(page).to have_current_path(user_path(@user))  
    end  
  end
end