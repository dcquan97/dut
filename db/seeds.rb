# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.with_deleted.delete_all
User.create( email: "admin@admin.com",
    password: 'Abc123@@@',
    password_confirmation: 'Abc123@@@',
    name: 'admin',
    confirmed_at: Time.current,
    avatar: File.open(Rails.root.join('db/fixtures/images/human_illustrator.jpg'))
  )
