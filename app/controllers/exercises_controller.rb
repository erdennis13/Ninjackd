class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]

  def index
    @exercises = Exercise.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    @exercises = @exercises.search(params[:search]) if params[:search].present?
    @exercises = @exercises.lookfor(params[:lookfor]) if params[:lookfor].present?
  end

  def show
  end

  def new
    @exercise = Exercise.new
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
  end

  def destroy
    @exercise.destroy
    respond_to do |format|
      format.html { redirect_to exercises_url }
      format.json { head :no_content }
    end
  end

  private
    def set_exercise
      @exercise = Exercise.find(params[:id])
    end

    def exercise_params
      params.require(:exercise).permit(:name, :description, :diagram)
    end
end
