User.create email:"nash", password: "nash"

30.times do
user = User.create email: Faker::Internet.email, password: "p", password_confirmation: "p"
end

30.times do
  user = User.all.sample

  m = Post.create user_id: user.id, content: Faker::Company.bs
  m.save

end
