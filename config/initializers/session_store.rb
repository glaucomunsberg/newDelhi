# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_exemple_session',
  :secret      => 'db9afcdf5494e4ddf10ed286ddcd4f932d91169fcc344b1a79041c7e9f4076486ba4fa2d1d59fe525719f428b31888b30351f51b2e66d7e1b3767eeb0e9bbb54'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
