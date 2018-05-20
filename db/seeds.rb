# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(username: "ialhamad", email: "user@example.com", password: "123456789", password_confirmation: "123456789", is_admin: true)
Faculty.create(name: "Information Technology", user_id: 1)
Major.create(name: "Computer Science", faculty_id: 1, user_id: 1)
Course.create(name: "Theory of Computation ", major_id: 1, user_id: 1)