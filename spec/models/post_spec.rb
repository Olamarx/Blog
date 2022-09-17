require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    test_user = User.create(name: 'Queen of Great Britain', posts_counter: 0)
    Post.create(author: test_user, title: 'Supreme Leader', text: 'I love her', comments_counter: 0, likes_counter: 0)
  end
  before { subject.save }
  it 'title not be empty' do
    expect(subject).to be_valid
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter greater or equal to 0' do
    expect(subject.comments_counter).to be >= 0
  end

  it 'LikesCounter greater or equal to 0' do
    expect(subject.likes_counter).to be >= 0
  end
end
