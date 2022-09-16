first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
make_post = Post.create(author: second_user, title: 'World View', text: 'This is a second post')

(1..10).each do |index|
    Post.create(author: first_user, title: "This is number #{index}", text: "This Text is string and number #{index}")
end

(1..5).each do |index|
    Comment.create(author: first_user, posts: second_user, text: "my text is #{index}")
  end