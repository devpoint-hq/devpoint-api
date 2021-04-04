# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  user = User.create(
    email: Faker::Internet.unique.email,
    username: Faker::Internet.unique.username(specifier: 5..20),
    admin: false,
    developer: true,
    hiring_manager: false,
    password: '12345678',
    password_confirmation: '12345678'
  )
  user.names.create({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name}
  )
  user.links.create(
    [
      {
        name: 'GitHub',
        url: "https://github.com/fake-#{user.username}"
      },
      {
        name: 'LinkedIn',
        url: "https://www.linkedin.com/fake-#{user.username}"
      },
      {
        name: 'Zoom',
        url: "https://zoom.us/fake-#{user.username}"
      }
    ]
  )
  user.skills.create(
    [
      {
        name: 'React'
      },
      {
        name: 'Redux'
      },
      {
        name: 'Ruby'
      },
      {
        name: 'Ruby on Rails'
      },
      {
        name: 'Bootstrap'
      },
      {
        name: 'Bulma'
      }
    ]
  )
  user.jobs.create(title: 'Software Developer', company_name: 'Freelance')
end
