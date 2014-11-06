class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]

  def index
    @exercises = Exercise.all
    #respond_with(@exercises)
  end

  def show
    #respond_with(@exercise)
  end

  def new
    @exercise = Exercise.new
   # respond_with(@exercise)
  end

  def edit
  end

  def create
    @exercise = Exercise.new(exercise_params)
    respond_to do |format|
      if @exercise.save
        format.html { redirect_to @exercise, notice: 'Exercise was successfully created.' }
        format.json { render action: 'show', status: :created, location: @exercise }
      else
        format.html { redirect_to @exercise, notice: 'Exercise was unsuccessfully created.' }
        format.json { render action: 'show', status: :created, location: @exercise }
      end
    end
    #respond_with(@exercise)
  end

  def update
    @exercise.update(exercise_params)
    respond_to do |format|
      if @exercise.save
        format.html { redirect_to @exercise, notice: 'Exercise was successfully created.' }
        format.json { render action: 'show', status: :created, location: @exercise }
      else
        format.html { redirect_to @exercise, notice: 'Exercise was unsuccessfully created.' }
        format.json { render action: 'show', status: :created, location: @exercise }
      end
    end
    #respond_with(@exercise)
  end

  def destroy
    @exercise.destroy
    respond_to do |format|
      format.html { redirect_to exercises_url }
      format.json { head :no_content }
    end
    #respond_with(@exercise)
  end

  private
    def set_exercise
      @exercise = Exercise.find(params[:id])
    end

    def exercise_params
      params.require(:exercise).permit(:name, :description, :diagram)
    end
end
