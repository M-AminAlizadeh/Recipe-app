# Users
users = [
  { name: 'User1', email: 'user1@example.com', password: 'password123' },
  { name: 'User2', email: 'user2@example.com', password: 'password456' }
]
users.each do |user_data|
  user = User.find_by(email: user_data[:email])

  unless user
    User.create!(user_data)
    puts "User '#{user_data[:email]}' created."
  end
end

# Recipes 
recipes = [
  { title: 'Recipe 1', description: 'Description 1', user: User.first },
  { title: 'Recipe 2', description: 'Description 2', user: User.second }
]

Recipe.create!(recipes)
