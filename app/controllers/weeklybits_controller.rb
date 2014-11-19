class WeeklybitsController < ApplicationController
  before_action :set_weeklybit, only: [:show, :edit, :update, :destroy]

  def index
    @weeklybits = Weeklybit.all
  end

  def show
  end

  def new
    @weeklybit = Weeklybit.new
  end

  def edit
  end

  def create
    @weeklybit = Weeklybit.new(weeklybit_params)
   respond_to do |format|
      if @weeklybit.save
        format.html { redirect_to :back, notice: 'Weeklybit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @weeklybit }
      else
        format.html { redirect_to weeklybits_url, notice: 'Weeklybit was unsuccessfully created.' }
        format.json { render action: 'show', status: :created, location: @weeklybit }
      end
    end
  end

  def update
    @weeklybit.update(weeklybit_params)
   respond_to do |format|
      if @weeklybit.save
        format.html { redirect_to weeklybits_url, notice: 'Weeklybit was successfully updated.' }
        format.json { render action: 'show', status: :created, location: @weeklybit }
      else
        format.html { redirect_to weeklybits_url, notice: 'Weeklybit was unsuccessfully updated.' }
        format.json { render action: 'show', status: :created, location: @weeklybit }
      end
    end
  end

  def destroy
    @weeklybit.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    def set_weeklybit
      @weeklybit = Weeklybit.find(params[:id])
    end

    def weeklybit_params
      params.require(:weeklybit).permit(:weeklyplan_id, :workout_id, :day)
    end
end
