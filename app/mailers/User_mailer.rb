class UserMailer < ApplicationMailer
  default from: 'weclome@happycamper.com'

  def request_mailer(user, gear, date1, date2)
    @user = user
    @gear = gear
    @date1 = date1
    @date2 = date2
    mail(to: @gear.user.email, subject: "#{@user.username.capitalize} would like to borrow some gear. ")
  end

end
