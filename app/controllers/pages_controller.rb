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

  def paypal_payment_recurring
  	@user = current_user
  	ppr = PayPal::Recurring.new({
  		:token => @user.paypal_payment_token,
      	:payer_id => @user.paypal_customer_token,
      	:amount => 9.99,
      	:description => "Ninjackd Subscription",
      	currency: "USD",
      	frequency: 1,
      	period: :monthly,
      	start_at: Time.zone.now,
      	failed: 1,
		outstanding: :next_billing,
		trial_length: 14,
		trial_period: :daily,
		trial_frequency: 1
  		})
  	response = ppr.request_payment
  	response.approved?
  	response.complete?

  	response = ppr.create_recurring_profile
  	@user.paypal_recurring_profile = response.profile_id
  end
end
