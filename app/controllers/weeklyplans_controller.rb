class WeeklyplansController < ApplicationController
  before_action :set_weeklyplan, only: [:show, :edit, :update, :destroy]

  def index
    @weeklyplans = Weeklyplan.all
  end

  def show
    @workouts = Workout.all
  end

  def new
    @weeklyplan = Weeklyplan.new
  end

  def edit
  end

  def create
    @weeklyplan = Weeklyplan.new(weeklyplan_params)
   respond_to do |format|
      if @weeklyplan.save
        format.html { redirect_to weeklyplans_url, notice: 'Weeklyplan was successfully created.' }
        format.json { render action: 'show', status: :created, location: @weeklyplan }
      else
        format.html { redirect_to weeklyplans_url, notice: 'Weeklyplan was unsuccessfully created.' }
        format.json { render action: 'show', status: :created, location: @weeklyplan }
      end
    end
  end

  def update
    @weeklyplan.update(weeklyplan_params)
   respond_to do |format|
      if @weeklyplan.save
        format.html { redirect_to weeklyplans_url, notice: 'Weeklyplan was successfully updated.' }
        format.json { render action: 'show', status: :created, location: @weeklyplan }
      else
        format.html { redirect_to weeklyplans_url, notice: 'Weeklyplan was unsuccessfully updated.' }
        format.json { render action: 'show', status: :created, location: @weeklyplan }
      end
    end
  end

  def destroy
    @weeklyplan.destroy
    respond_to do |format|
      format.html { redirect_to weeklyplans_url }
      format.json { head :no_content }
    end
  end

  private
    def set_weeklyplan
      @weeklyplan = Weeklyplan.find(params[:id])
    end

    def weeklyplan_params
      params.require(:weeklyplan).permit(:name, :active)
    end
end
