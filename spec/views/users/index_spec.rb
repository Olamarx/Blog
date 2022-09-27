require 'rails_helper'
require 'users_helper_spec'

RSpec.describe 'Landing page', type: :feature do
  describe 'test' do
    before(:each) do
      @user = User.create(name: 'Owoeye', bio: 'Teacher from Poland.', photo: 'https://github.com/masangana/blog/blob/ff0fc0a1396204b7be88769e650aa1a3dfee29b4/app/assets/images/2.jpg')
      @id = @user.id
    end

    it 'displays username' do
      visit root_path
      expect(page).to have_content(@user.name)
    end

    it 'displays posts counter' do
      visit root_path
      expect(page).to have_content(@user.posts_counter)
    end
    it 'displays profile picture' do
      visit root_path
      expect(page).to have_css("img[src'#{@user.photo}']")
    end
    it 'redirects to show page' do
      visit root_path
      click_link(@user.name)
      expect(page).to have_content('bio')
    end
  end
end
