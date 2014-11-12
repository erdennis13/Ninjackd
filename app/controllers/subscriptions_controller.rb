class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]

  def index
    @subscriptions = Subscription.all
  end

  def show
  end

  def new
    @subscription = Subscription.new
  end

  def edit
  end

  def profile
    @subscriptions = current_user.subscriptions.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  def create
    @subscription = Subscription.new(subscription_params)
    respond_to do |format|
      if @subscription.save
        format.html { redirect_to profile_url, notice: 'Subscription was successfully created.' }
        format.json { render action: 'show', status: :created, location: @subscription }
      else
        format.html { redirect_to workouts_path, notice: "You're already subscribed to this workout" }
        format.json { render action: 'show', status: :created, location: @subscription }
      end
    end
  end

  def update
    @subscription.update(subscription_params)
    respond_to do |format|
      if @subscription.save
        format.html { redirect_to @subscription, notice: 'Subscription was successfully updated.' }
        format.json { render action: 'show', status: :created, location: @subscription }
      else
        format.html { redirect_to @subscription, notice: 'Subscription was unsuccessfully updated.' }
        format.json { render action: 'show', status: :created, location: @subscription }
      end
    end
  end

  def destroy
    @subscription.destroy
    respond_to do |format|
      format.html { redirect_to profile_url }
      format.json { head :no_content }
    end
  end

  private
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    def subscription_params
      params.require(:subscription).permit(:user_id, :workout_id, :complete)
    end
end
