class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]

  def index
    @subscriptions = Subscription.all
  end

  def show
  end

  def new
    @weekplan = Weekplan.find(params[:id])
    @workoutCount = 0
    unless @weekplan.mon_workout_id.blank?; @workoutCount +=1 end
    unless @weekplan.tues_workout_id.blank?; @workoutCount +=1 end
    unless @weekplan.wed_workout_id.blank?; @workoutCount +=1 end
    unless @weekplan.thurs_workout_id.blank?; @workoutCount +=1 end
    unless @weekplan.fri_workout_id.blank?; @workoutCount +=1 end
    unless @weekplan.sat_workout_id.blank?; @workoutCount +=1 end
    unless @weekplan.sun_workout_id.blank?; @workoutCount +=1 end
    @subscription = Subscription.new(@workoutCount)
  end

  def edit
  end

  def profile
    @subscriptions = current_user.subscriptions.where(:complete => false).where.not(schedule: Date.today).order("schedule ASC").paginate(:page => params[:page], :per_page => 10)
    @scheduled = current_user.subscriptions.where.not(schedule: nil )
    today = Date.today
    @days_from_this_week = (today.at_beginning_of_week(:sunday)..today.at_end_of_week(:sunday)).map
    @todaySubscriptions = current_user.subscriptions.where(schedule: Date.today, complete: false)
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
      params.require(:subscription).permit(:user_id, :workout_id, :complete, :start_time, :finish_time, :schedule)
    end
end
