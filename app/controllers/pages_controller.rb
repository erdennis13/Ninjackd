class PagesController < ApplicationController
  def home
    @workouts = Workout.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 1)
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

  def ethans_week
    if Rails.env == 'development'
      @ethan = User.find(1)
    elsif Rails.env == 'production'
      @ethan = User.find(6)
    end
    

    @subscriptions = Subscription.where(user_id: @ethan.id).where(schedule: Date.today.at_beginning_of_week(:sunday)..Date.today.at_end_of_week(:sunday)).all
    @date = Date.today.beginning_of_week(:sunday)
    @dates = Hash.new
    @dates[0] = @date
    @dates[1] = @date + 1
    @dates[2] = @date + 2
    @dates[3] = @date + 3
    @dates[4] = @date + 4
    @dates[5] = @date + 5
    @dates[6] = @date + 6
  end

  def cancel_account
  	@user = current_user

    @pastuser = Pastuser.new
    @pastuser.username = @user.username
    @pastuser.email = @user.email
    @pastuser.save

  	ppr = PayPal::Recurring.new(profile_id: @user.try(:paypal_customer_token))
  	ppr.cancel
  	@user.destroy

  	flash[:notice] = "Your account has been cancelled and billing will be discontinued. We're sorry to see you go; come back anytime!"
  	redirect_to root_url
  end

  def request_payment_process

  	name = params["user"][:name]
  	paypal_payment_token = params["user"][:paypal_payment_token]
  	paypal_customer_token = params["user"][:paypal_customer_token]
  	username = params["user"][:username]
  	email = params["user"][:email]
  	password = params["user"][:password]

    #This function sets up a recurring billing profile and requests payment from paypal
  	ppr = PayPal::Recurring.new({
  		token: paypal_payment_token,
  		payer_id: paypal_customer_token,
  		amount: 9.99,
  		description: "Ninjackd Subscription",
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
  	response2 = ppr.create_recurring_profile
  	paypal_recurring_profile = response2.profile_id


  	@user = User.new(name: name, username: username, email: email, password: password, paypal_payment_token: paypal_payment_token, 
  		paypal_customer_token: paypal_customer_token, paypal_recurring_profile: paypal_recurring_profile)
  	@user.save!
  	sign_in @user

  	flash[:notice] = "Thanks for joining us! Get started by checking out the workouts below."

  	redirect_to workouts_path
  end	


end
