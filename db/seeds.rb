30.times do
user = User.create email: Faker::Internet.email, password: "p", password_confirmation: "p"
end
