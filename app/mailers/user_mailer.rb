class UserMailer < ActionMailer::Base
  default from: "tds@perfectial.com"

  def sample_email(user, device, room)
    @user = user
    @device = device
    @room = room

    p '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
    p @user
    p @device
    p @room
    mail(to: @user.email, subject: 'TDS notification')
  end
end
