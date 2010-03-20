# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_GM1965_session',
  :secret      => '6974f88b303066707954a888f0f3f3580850695661ba3df3b761b8eea417d9bb1961fc13340535961fca0058e4f5818ef183ff31bbd7442c30a4542c2e37fccf'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
