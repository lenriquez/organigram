# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
namespace :db do
  def add_users
    User.destroy_all
    User.create!({ name: "test_user",
                   email: "test@email.com",
                   password: "right_password"})
    p "Test User has been created"
  end

  task :add_users do
    add_users
  end

  task :seed do
    Rake::Task["db:add_users"].invoke if Rails.env == "development"
  end
end

