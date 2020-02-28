class SendNotificationsJob < ApplicationJob
  queue_as :default

  def perform(user)
  	UserMailer.send_email(user).deliver_now
  end
end
