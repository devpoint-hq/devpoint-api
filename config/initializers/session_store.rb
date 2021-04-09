DevPoint::Application.config.session_store :cookie_store, key: '_dev_point_session', same_site: :none, secure: Rails.env.production?
