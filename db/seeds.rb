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
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    other_names: Faker::Name.neutral_first_name,
    admin: false,
    developer: true,
    hiring_manager: false,
    password: '12345678',
    password_confirmation: '12345678'
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
        name: 'React',
        years_of_experience: rand(1..5),
        number_of_projects: rand(1..5),
        self_rating: rand(5..10)
      },
      {
        name: 'Redux',
        years_of_experience: rand(1..5),
        number_of_projects: rand(1..5),
        self_rating: rand(5..10)
      },
      {
        name: 'Ruby',
        years_of_experience: rand(1..10),
        number_of_projects: rand(1..5),
        self_rating: rand(5..10)
      },
      {
        name: 'Ruby on Rails',
        years_of_experience: rand(1..10),
        number_of_projects: rand(1..15),
        self_rating: rand(5..10)
      },
      {
        name: 'Bootstrap',
        years_of_experience: rand(1..7),
        number_of_projects: rand(1..5),
        self_rating: rand(5..10)
      },
      {
        name: 'Bulma',
        years_of_experience: rand(1..5),
        number_of_projects: rand(1..5),
        self_rating: rand(5..10)
      }
    ]
  )
  user.jobs.create(title: 'Software Developer', company_name: Faker::Company.name)
end
