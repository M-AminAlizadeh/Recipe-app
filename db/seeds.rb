5.times do |i|
  user = User.create!(
    email: "user#{i + 1}@example.com",
    password: 'password',
    password_confirmation: 'password'
  )

  3.times do |j|
    recipe = user.recipes.create!(
      title: "Recipe #{j + 1} for User #{i + 1}",
      description: "This is recipe #{j + 1} for user #{i + 1}.",
      preparation_time: rand(1..3),
      cooking_time: rand(20..60),
      public: [true, false].sample
    )

    4.times do |k|
      food = Food.create!(
        name: "Food #{k + 1} for User #{i + 1} Recipe #{j + 1}",
        measurement_unit: ['Unit', 'Kg', 'Liter'].sample,
        unit_price: rand(1.0..10.0).round(2)
      )

      recipe.recipe_foods.create!(
        food: food,
        quantity: rand(1..5)
      )
    end
  end
end
