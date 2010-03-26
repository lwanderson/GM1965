class RegistrationMailer < ActionMailer::Base

  def registration_received_message(registration)
    recipients 'register@gmclassof65.org'
    subject    "gmclassof65.org registration received"
    from       'info@gmclassof65.org'
    body       :registration => registration
  end
end
