# frozen_string_literal: true

Rails.application.config.session_store :cookie_store, key: '_ss_app_session', domain: 'ssapp.com'
Rails.application.config.session_store :cookie_store, key: '_ss_auth_token', domain: 'ssapp.com'
