class UserMailer < ActionMailer::Base

  def registration_received_message(registration)
    recipients registration.email
    subject    "Your gmclassof65.org registration has been received"
    from       'register@gmclassof65.org'
    body       :registration => registration
  end

  def password_change_message(user, new_password)
    recipients user.emailaddress
    subject    "Your gmclassof65.org password has been reset"
    from       'info@gmclassof65.org'
    body       :user => user
    body       :new_password => new_password
  end
end
