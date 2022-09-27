def create_user(name)
  user = User.create!(
      name:, bio: "Bio of #{name}", photo: 'photo-url'
    )
    user.save
    user
end
