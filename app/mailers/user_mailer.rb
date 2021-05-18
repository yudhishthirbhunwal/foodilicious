class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.order_email.subject
  #
  def order_email
    @seller = params[:seller]
    @food_item = params[:food_item]
    @buyer = params[:buyer]
    mail(to: @seller.email, subject: 'Order Placed!')
  end
end
