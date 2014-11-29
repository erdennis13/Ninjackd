class PagesController < ApplicationController
  def home
  end

  def about
  end

  def paypal_checkout
  	ppr = PayPal::Recurring.new({
  		return_url: new_user_registration_url,
  		cancel_url: root_url,
  		description: "Ninjackd Subscription",
  		amount: 9.99,
  		currency: "USD"
  		})
  	response = ppr.checkout
  	if response.valid?
  		redirect_to response.checkout_url
  	else
  		raise response.errors.inspect
  	end
  end
end
