class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@#{ENV["WEBSITE"]}"
  layout 'mailer'
end
