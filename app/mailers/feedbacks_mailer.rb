class FeedbacksMailer < ApplicationMailer
  def feedback_message(body, user)
    @body = body
    @user = user

    mail to: ENV['SMTP_USERNAME'], from: ENV['SMTP_USERNAME']
  end
end