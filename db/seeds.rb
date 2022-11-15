# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do
    User.create(name: Faker::Name.first_name)
end

2.times do
    Board.create(name: Faker::Game.title)
end

50.times do
    entry = Entry.create(
        score: Faker::Number.number(digits: 4),
        user_id: Faker::Number.between(from: 1, to: 10),
        board_id: Faker::Number.between(from: 1, to: 5)
    )

    entry.scored_at = entry.created_at
    entry.save
end
