class UserMailer < ApplicationMailer
  def account_activation user
    @data = {
        user: user,
    }
    mail to: user.email, subject: t("auths.mail.subject")
  end

  def password_reset user
    @data = {
        user: user,
    }
    mail to: user.email, subject: t("auths.forget_password.title")
  end
end
