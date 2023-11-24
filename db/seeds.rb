5.times do |i|
  user = User.create!(
    email: "user#{i + 1}@example.com",
    password: 'password',
    password_confirmation: 'password'
  )

  3.times do |j|
    user.recipes.create!(
      title: "Recipe #{j + 1} for User #{i + 1}",
      description: "This is recipe #{j + 1} for user #{i + 1}.",
      preparation_time: rand(1..3),
      cooking_time: rand(20..60),
      public: [true, false].sample
    )
  end
end
