class WorkoutbitsController < ApplicationController
  before_action :set_workoutbit, only: [:show, :edit, :update, :destroy]

  def index
    @workoutbits = Workoutbit.all
  end

  def show
  end

  def new
    @workoutbit = Workoutbit.new
  end

  def edit
  end

  def create
    @workoutbit = Workoutbit.new(workoutbit_params)
    respond_to do |format|
      if @workoutbit.save
        format.html { redirect_to @workoutbit, notice: 'Workoutbit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @workoutbit }
      else
        format.html { redirect_to @workoubit, notice: 'Workoutbit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @workoutbit }
      end
    end
  end

  def update
    @workoutbit.update(workoutbit_params)
    respond_to do |format|
      if @workoutbit.save
        format.html { redirect_to @workoutbit, notice: 'Workoutbit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @workoutbit }
      else
        format.html { redirect_to @workoubit, notice: 'Workoutbit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @workoutbit }
      end
    end
  end

  def destroy
    @workoutbit.destroy
    respond_to do |format|
      format.html { redirect_to workoutbits_url }
      format.json { head :no_content }
    end
  end

  private
    def set_workoutbit
      @workoutbit = Workoutbit.find(params[:id])
    end

    def workoutbit_params
      #params.require(:workoutbit).permit(workout_attributes: [:workout_id], exercise_attributes: [:exercise_id], :sets, :reps)
      params.require(:workoutbit).permit(:workout_id, :exercise_id, :sets, :reps)
    end
end
