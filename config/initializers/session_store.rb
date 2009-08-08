# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_address_book_session',
  :secret      => '70b73ca13b02a19d6a4ac4197e4e366b3e70a7e0cb73eaffac973cdb630b6cc6a3d3cbe9178047466ba47d6d4d7ca743970ac12b50c58594e5bc4015f808cd50'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
