DevPoint::Application.config.session_store :cookie_store, key: '_dev_point_session', secure: Rails.env.production?
