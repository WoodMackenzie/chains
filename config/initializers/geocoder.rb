# config/initializers/geocoder.rb
Geocoder.configure(

  # geocoding service request timeout, in seconds (default 3):
  :timeout => 5,

  # use a proxy to access the service:
  #:http_proxy => "http://wmhproxy2:8080"
  #Geocoder::Configuration.https_proxy = "127.4.4.2" # only if HTTPS is needed

)