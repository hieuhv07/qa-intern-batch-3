99.times do |n|
  user_name = Faker::Name.name
  full_name = Faker::FunnyName.name_with_initial
  email = "example#{n+1}@railstutorial.org"
  password = "123123"
  User.create!(user_name: user_name,
               full_name: full_name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end
