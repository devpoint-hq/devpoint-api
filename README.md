# DevPoint API
This is the backend API of DevPoint. Frontend repo available [here](https://github.com/anewman15/dev-point-react/)

## App Screenshot
![app screenshot](./app-screenshot.png)

## Built With

* Ruby v 2.7.1
* Rails v 6.0.3.3
* Devise
* PostgreSQL
* Jbuilder

## Live Version
Live on [Heroku](https://anewman15-dev-point.herokuapp.com/)

## Local Deployment

### Getting Started

1. Navigate to a directory of your choice and get a local copy from [this repo](https://github.com/anewman15/dev-point/)
2. `cd` into your cloned folder.

### Setup

Install gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
   rails db:seed
```

### Usage

Start server with:

```
    rails server
```

1. Open `http://localhost:3000/` in your browser
2. Sign up, log in and use the website to view developers list, their profiles
3. Set appointments from the `/book_appointments` route
4. View the list of your appointments from `/appointments` route

## Testing
1. Run `bundle exec rspec spec/models` in the Terminal to run the models tests
2. Run `bundle exec rspec spec/controllers` in the Terminal to run the controllers tests

## Author
👤 **Abdullah Numan**

- Github:   https://github.com/anewman15
- Twitter:  https://twitter.com/aanuman15
- Linkedin: https://www.linkedin.com/in/aanuman15/
- Email:    anewman15@hotmail.com

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/anewman15/dev-point/issues/).

## Show your support

Give a ⭐️ if you like this project!


## Acknowledgments

- https://www.microverse.org/
- https://www.theodinproject.com/
- https://guides.rubyonrails.org/
- https://www.stackoverflow.com/
