class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy, :assign]

  def index
    @workouts = Workout.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    @weekplans = Weekplan.all
    @workoutCategories = ["",]
    @workouts.each do |add|
      @workoutCategories.append(add.category)
    end
    @workouts = @workouts.cat(params[:cat]) if params[:cat].present?
    @workouts = @workouts.starts_with(params[:starts_with]) if params[:starts_with].present?
    @workouts = @workouts.duration_lt(params[:less_than]) if params[:less_than].present?
    @workouts = @workouts.search(params[:search]) if params[:search].present?
    @user = current_user

    @weeklyplans = Weeklyplan.all
  end

  def admin
    @workouts = Workout.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  def findWorkout
    @workouts = Workout.all
    @workoutCategories = ["",]
    @workouts.each do |add|
      @workoutCategories.append(add.category)
    end
    @facilityOptions = ["","yes", "no"]
    @workouts = @workouts.cat(params[:cat]) if params[:cat].present?
    @workouts = @workouts.starts_with(params[:starts_with]) if params[:starts_with].present?
    @workouts = @workouts.duration_lt(params[:less_than]) if params[:less_than].present?
    @workouts = @workouts.search(params[:search]) if params[:search].present?
    @workouts = @workouts.facility(params[:facility]) if params[:facility].present?
  end

  def show
    @exerciseOptions = Exercise.all
    @exerciseidoptions = []
    @exerciseOptions.each do |add|
      @exerciseidoptions.append(add)
    end

    @warmupoptions = Warmup.all
    @warmupidoptions = []
    @warmupoptions.each do |add|
      @warmupidoptions.append(add)
    end

    @warmups = @workout.warmworks.all

  end

  def new
    @workout = Workout.new
    @workoutbits = @workout.workoutbits.build
    @exercise = @workoutbits.build_exercise
    @facilityOptions = ["","yes", "no"]

    @warmupoptions = Warmup.all
    @warmupidoptions = []
    @warmupoptions.each do |add|
      @warmupidoptions.append(add.id)
    end
  end
  
  def edit
    @facilityOptions = ["","yes", "no"]
  end

  def create
    @workout = Workout.new(workout_params)
    respond_to do |format|
      if @workout.save
        format.html { redirect_to @workout, notice: 'Workout was successfully created.' }
        format.json { render action: 'show', status: :created, location: @workout }
      else
        format.html { redirect_to @workout, notice: 'Workout was unsuccessfully created.' }
        format.json { render action: 'show', status: :created, location: @workout }
      end
    end
  end

  def update
    @workout.update(workout_params)
    respond_to do |format|
      if @workout.save
        format.html { redirect_to @workout, notice: 'Workout was successfully updated.' }
        format.json { render action: 'show', status: :created, location: @workout }
      else
        format.html { redirect_to @workout, notice: 'Workout was unsuccessfully updated.' }
        format.json { render action: 'show', status: :created, location: @workout }
      end
    end
  end


  def destroy
    @workout.destroy
    respond_to do |format|
      format.html { redirect_to workouts_url }
      format.json { head :no_content }
    end
  end

  private
    def set_workout
      @workout = Workout.find(params[:id])
    end

    def workout_params
      #params.require(:workout).permit(:name, :category, :description, :duration)
      params.require(:workout).permit(:name, :category, :description, :duration, :weightFacility, workoutbits_attributes: [ :id, :sets, :reps, exercise_attributes: [:id]])
    end

end
