
def create_posts_for_user(user, count: 1)
  posts = []
  count.times do |p|
    posts << Post.create!(
      author: user,
      title: "Post #{p}",
      text: "This is description of post #{p}",
   
    )
  end
  posts
ends