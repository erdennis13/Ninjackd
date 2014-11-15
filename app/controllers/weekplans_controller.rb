class WeekplansController < ApplicationController
  before_action :set_weekplan, only: [:show, :edit, :update, :destroy]

  def index
    @weekplans = Weekplan.all
  end

  def show
  end

  def new
    @weekplan = Weekplan.new
    @workouts = Workout.all
    @workoutOptions = [""]
    @workouts.each do |list|
      @workoutOptions.append(list.id)
    end
  end

  def edit
    @workouts = Workout.all
    @workoutOptions = [""]
    @workouts.each do |list|
      @workoutOptions.append(list.id)
    end
  end

  def create
    @weekplan = Weekplan.new(weekplan_params)
    respond_to do |format|
      if @weekplan.save
        format.html { redirect_to weekplans_url, notice: 'Weekplan was successfully created.' }
        format.json { render action: 'show', status: :created, location: @weekplan }
      else
        format.html { redirect_to weekplans_url, notice: 'Weekplan was unsuccessfully created.' }
        format.json { render action: 'show', status: :created, location: @weekplan }
      end
    end
  end

  def update
    @weekplan.update(weekplan_params)
    respond_to do |format|
      if @weekplan.save
        format.html { redirect_to weekplans_url, notice: 'Weekplan was successfully updated.' }
        format.json { render action: 'show', status: :created, location: @weekplan }
      else
        format.html { redirect_to weekplans_url, notice: 'Weekplan was unsuccessfully updated.' }
        format.json { render action: 'show', status: :created, location: @weekplan }
      end
    end
  end

  def destroy
    @weekplan.destroy
    respond_to do |format|
      format.html { redirect_to weekplans_url }
      format.json { head :no_content }
    end
  end

  private
    def set_weekplan
      @weekplan = Weekplan.find(params[:id])
    end

    def weekplan_params
      params.require(:weekplan).permit(:name, :sunday_workout_id, :monday_workout_id, :tuesday_workout_id, :wednesday_workout_id, :thursday_workout_id, :friday_workout_id, :saturday_workout_id)
    end
end
