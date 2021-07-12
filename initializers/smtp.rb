# ActionMailer::Base.smtp_settings = {
#   domain: 'http://localhost:3000/',
#   #domain: 'http://rocketelevators.online/',
#   address:        "smtp.sendgrid.net",
#   port:            587,
#   authentication: :plain,
#   #user_name:      ENV['SENDGRID_USERNAME'],
#   user_name:      'apikey',
#   password:       ENV['SENDGRID_API_KEY']
# }

#alternative
# ActionMailer::Base.smtp_settings = {
#   :user_name => 'apikey',
#   :password => '<SENDGRID_API_KEY>',
#   #:password => Rails.application.secrets.SENDGRID_API_KEY,
#   :domain => 'http://localhost:3000/',
#   :address => 'smtp.sendgrid.net',
#   :port => 587,
#   :authentication => :plain,
#   :enable_starttls_auto => true
# }