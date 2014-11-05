class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy, :assign]

  def index
    @workouts = Workout.all
  end

  def show
    @exerciseOptions = Exercise.all
    @exerciseidoptions = []
    @exerciseOptions.each do |add|
      @exerciseidoptions.append(add.id)
    end
  end

  def new
    @workout = Workout.new
    @workoutbits = @workout.workoutbits.build
    @exercise = @workoutbits.build_exercise
  end

  def category
    @workouts = Workout.all
    @workoutCategories = []
    @workouts.each do |add|
      @workoutCategories.append(add.category)
    end
    @categorySelect

    #@strength = @workouts.where(category: "Strength")
    @strength = @workouts.strength

    @workouts = @workouts.cat(params[:cat]) if params[:cat].present?
  end

  def edit
  end

  def create
    @workout = Workout.new(workout_params)
    respond_to do |format|
      if @workout.save
        format.html { redirect_to @workout, notice: 'Workout was successfully created.' }
        format.json { render action: 'show', status: :created, location: @workout }
      else
        format.html { redirect_to @workout, notice: 'Workout was successfully created.' }
        format.json { render action: 'show', status: :created, location: @workout }
      end
    end
  end

  def update
    @workout.update(workout_params)
    respond_to do |format|
      if @workout.save
        format.html { redirect_to @workout, notice: 'Workout was successfully created.' }
        format.json { render action: 'show', status: :created, location: @workout }
      else
        format.html { redirect_to @workout, notice: 'Workout was successfully created.' }
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
      params.require(:workout).permit(:name, :category, :description, :duration, workoutbits_attributes: [ :id, :sets, :reps, exercise_attributes: [:id]])
    end

end
