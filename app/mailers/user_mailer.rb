class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: t("auths.mail.subject")
  end

  def password_reset
    @greeting = t "auths.mail.greeting"

    mail to: "to@example.org"
  end
end
