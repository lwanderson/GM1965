class UserMailer < ActionMailer::Base

  require 'smtp_tls'

  def registration_received_message(registration)
    recipients registration.email
    subject    "Your gmclassof65.org registration has been received"
    from       'gmclassof65@gmclassof65.org'
    body       :registration => registration
  end

  def registration_confirmed_message(user)
    recipients registration.email
    subject    "Your gmclassof65.org registration has been confirmed"
    from       'gmclassof65@gmclassof65.org'
    body       :user => user
    body       :new_password => new_password
  end

  def password_change_message(user, new_password)
    recipients user.emailaddress
    subject    "Your gmclassof65.org password has been reset"
    from       'gmclassof65@gmclassof65.org'
    body       :user => user
    body       :new_password => new_password
  end
end
