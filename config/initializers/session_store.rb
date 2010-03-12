# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_didyoubuyanipad_session',
  :secret      => '4cf533d322d75b9a93c9b89b115a4952e219d66b478147926c00e7c7b0035ad4dc4718eb5dc6252dc52c8104dccfd8ff43a0905be0796f30f8f4d55e1a09b1a3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
