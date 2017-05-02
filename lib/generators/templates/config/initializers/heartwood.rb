Heartwood.configure do |config|

  # -------------------------------------------------- App Info

  # Heartwood uses these to set your root urls for
  # mailers and other fun stuff.
  #
  config.development_url = 'localhost:3000'
  config.production_url = 'example.com'

  # The title of your app is what Heartwood puts in the
  # browser tab by default.
  #
  config.app_title = 'Heartwood'

  # -------------------------------------------------- Caching

  # Heartwood's Pages come with action caching support. It is disabled by default.
  # Uncomment the setting below to enable action caching.
  #
  # NOTE: You must install the 'actionpack-action_caching' gem for this to work.
  #
  # config.cache_pages = true

end
