require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    user = User.create(name: 'King', bio: 'I am King Charlse III', posts_counter: 0)
    post_test = Post.create(author: user, title: 'title', comments_counter: 0, likes_counter: 0)
    Comment.new(author: user, post: post_test, text: 'Tesxt')
  end

  before { subject.save }

  it 'Should update comment counter' do
    expect(subject.post.comments_counter).to eq 1
  end

  it 'should have corresponding Bio' do
    expect(subject.post.author.bio).to eq 'I am King Charlse III'
  end
end
