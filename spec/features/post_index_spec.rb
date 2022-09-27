require 'rails_helper'
require 'helpers/posts_helper_spec.rb'
require 'helpers/users_helper_spec.rb'
require 'helpers/comments_helper_spec.rb'

RSpec.describe 'Post', type: :feature do
  context 'post index page' do
    before(:each) do
      @first_user = User.create(name: 'Owoeye', bio: 'Teacher from Poland.', photo: 'https://github.com/masangana/blog/blob/ff0fc0a1396204b7be88769e650aa1a3dfee29b4/app/assets/images/2.jpg')
        @fir
@post = Post.create(author: first_user, text: 'Hello World', title: 'Title for Post')
      @post.save
    end
    

    
    end
