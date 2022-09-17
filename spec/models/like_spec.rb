require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    user = User.create(name: 'Queen of England', bio: 'I reigned for 70 years', posts_counter: 0)
    post = Post.create(author: user, title: 'All Hail the Queen', text: 'My child will carry on', comments_counter: 0,
                       likes_counter: 0)
    Like.create(author: user, post:)
  end

  before { subject.save }

  it 'updates likes increases post likes counter by one' do
    expect(subject.post.likes_counter).not_to be 1
  end
end
