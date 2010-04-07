class RegistrationMailer < ActionMailer::Base

  require 'smtp_tls'

  def registration_received_message(registration)
    recipients 'register@gmclassof65.org'
    subject    "gmclassof65.org registration received"
    from       'gmclassof65@gmclassof65.org'
    body       :registration => registration
  end
end
