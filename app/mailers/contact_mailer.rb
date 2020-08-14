class ContactMailer < ApplicationMailer
  def contact_mail(message)
    @message = message
    mail to: "12@ab.com", subject: "メッセージ受信の確認メール"
  end
end
