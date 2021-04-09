Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ['localhost:3001', 'https://anewman15-dev-point.netlify.app']
    resource '*', headers: :any, methods: [:get, :post, :patch, :put, :delete], credentials: true
  end
end

Rails.application.config.hosts << "https://anewman15-dev-point.herokuapp.com/"