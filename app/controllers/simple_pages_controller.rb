class SimplePagesController < ApplicationController
  def index
  end

  def landing_page
      @products = Product.limit(3)
  end

  def thank_you
      byebug
      @name = params[:name]
      @email = params[:email]
      @message = params[:message]
      ActionMailer::Base.mail(from: @email,
        to: 'ashleylucero20@gmail.com',
        subject: "A new contact form message from #{@name}",
        body: @message).deliver_now

  end
end
