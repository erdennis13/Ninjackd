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
    @subscriptions = current_user.subscriptions.where(:complete => false, schedule: Date.today..Date.today + 14).where.not(schedule: Date.today).order("schedule ASC").paginate(:page => params[:page], :per_page => 10)
    @scheduled = current_user.subscriptions.where.not(schedule: nil, schedule: Date.today - 7..Date.today - 1)
    today = Date.today
    @days_from_this_week = (today.at_beginning_of_week(:sunday)..today.at_end_of_week(:sunday)).map
    @todaySubscriptions = current_user.subscriptions.where(schedule: Date.today, complete: false)
    @completedSubscriptions = current_user.subscriptions.where(complete: true, schedule: Date.today-7..Date.today)
  end

  def create
    test_schedule = params["subscription"][:schedule]

    unless ((Date.parse(test_schedule) rescue ArgumentError) == ArgumentError)
      @subscription = Subscription.new(subscription_params)
      #@subscription.schedule = Date.parse(test_schedule).strftime('%Y/%m/%d')
      respond_to do |format|
        if @subscription.save
          format.html { redirect_to profile_url, notice: 'Subscription was successfully created.' }
          format.json { render action: 'show', status: :created, location: @subscription }
        else
          format.html { redirect_to profile_url, notice: "You're already subscribed to this workout" }
          format.json { render action: 'show', status: :created, location: @subscription }
        end
      end
    else
      if test_schedule == nil
        notice = "Date should not be empty"
      elsif test_schedule.length == 0
        notice = "Date should not be empty"
      else
        notice = "#{test_schedule} is not a valid date"
      end
      redirect_to workout_path(params["subscription"][:workout_id]), notice: notice
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
