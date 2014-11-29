class HistoriesController < ApplicationController
  before_action :set_history, only: [:show, :edit, :update, :destroy]

  def index
    @histories = History.all
  end

  def show
  end

  def new
    @history = History.new
  end

  def currentWorkout
    @subscription = Subscription.find(params[:subscription_id])
    if @subscription.start_time.blank?
      @subscription.start_time = Time.now
      @subscription.save
    end
    @sublength = @subscription.histories.count
    @workoutlength = @subscription.workout.workoutbits.count

    if @sublength == @workoutlength
      @subscription.complete = true
      @subscription.finish_time = Time.now
      @subscription.save
      redirect_to completedWorkout_url(workout_id: @subscription.workout.id)
    else
      @subscription.complete = false
      @subscription.save
    end
    @warmups = @subscription.workout.warmworks.all
    @history = History.new

    flash[:notice] = "Make sure you mark your exercises complete as you do them"
  end

  def mark_all_complete
    @subscription = Subscription.find(params[:subscription_id])
    histories = History.where(subscription_id: :subscription_id)
    @subscription.workout.workoutbits.each do |complete|

      @history = History.new
      @history.subscription_id = @subscription.id
      @history.exercise_id = complete.exercise_id
      @history.complete = true
      @history.reps = complete.reps
      @history.sets = complete.sets
      @history.save
        
    end
    @subscription.complete = true
    @subscription.finish_time = Time.now
    @subscription.save
    redirect_to completedWorkout_url(workout_id: @subscription.workout_id)
  end

  def edit
  end

  def create
    @history = History.new(history_params)
    respond_to do |format|
      if @history.save
        format.html { redirect_to :back, notice: 'History was successfully created' }
        format.json { render action: 'show', status: :created, location: @history }
      else
        format.html { redirect_to :back, notice: "You've already marked this as complete" }
        format.json { render action: 'show', status: :created, location: @history }
      end
    end
  end

  def update
    @history.update(history_params)
    respond_to do |format|
      if @history.save
        format.html { redirect_to @history, notice: 'Histoy was successfully updated.' }
        format.json { render action: 'show', status: :created, location: @history }
      else
        format.html { redirect_to @history, notice: 'History was unsuccessfully updated.' }
        format.json { render action: 'show', status: :created, location: @history }
      end
    end
  end

  def destroy
    @history.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    def set_history
      @history = History.find(params[:id])
    end

    def history_params
      params.require(:history).permit(:subscription_id, :exercise_id, :complete, :sets, :reps)
    end
end
