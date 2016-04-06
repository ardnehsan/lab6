User.create email:"nash", password: "nash", photo_id: "rinzler.png"

30.times do
user = User.create email: Faker::App.name, password: "p", password_confirmation: "p", photo_id:Faker::Avatar.image
end

50.times do
  user = User.all.sample

  m = Post.create user_id: user.id, content: Faker::Hacker.say_something_smart
  m.save

end
