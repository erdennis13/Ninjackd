class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :subscriptions
  has_many :workouts, :through => :subscriptions
  has_many :likes
  has_many :workouts, :through => :likes
  has_many :comments
  has_many :users, :through => :comments

  accepts_nested_attributes_for :subscriptions

  validates_presence_of :name, :username, :paypal_payment_token
  validates_uniqueness_of :username, :email

  def request_paypal_payment
    @user = current_user
    ppr = PayPal::Recurring.new({
      :token       => @user.paypal_payment_token,
      :payer_id    => @user.paypal_customer_token,
      :amount      => 9.99,
      :description => "Ninjackd Subscription"
      })
    response = ppr.request_payment
    response.approved?
    response.completed?
  end

  def make_recurring_profile
    @user = current_user
    ppr = PayPal::Recurring.new({
      amount: 9.99,
      currency: "USD",
      description: "Ninjackd Subscription",
      frequency: 1,
      period: :monthly,
      payer_id: @user.paypal_payment_token,
      start_at: Time.zone.now,
      failed: 1,
      outstanding: :next_billing,

      })
    response = ppr.create_recurring_profile
    @user.paypal_recurring_profile = response.profile_id
  end

end
