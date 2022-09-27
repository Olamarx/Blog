
  def create_comments_by_user(user, post, count: 1)
    comments = []
    count.times do |c| 
     comment = Comment.create!(post:, author: user, text: "Coment text of #{c}")
     comments << comment
    end
   comments
  end