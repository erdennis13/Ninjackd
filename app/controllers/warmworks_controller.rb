class WarmworksController < ApplicationController
  before_action :set_warmwork, only: [:show, :edit, :update, :destroy]

  def index
    @warmworks = Warmwork.all
  end

  def show
  end

  def new
    @warmwork = Warmwork.new
  end

  def edit
  end

  def create
    @warmwork = Warmwork.new(warmwork_params)
    respond_to do |format|
      if @warmwork.save
        format.html { redirect_to :back, notice: 'Warmwork was successfully created.' }
        format.json { render action: 'show', status: :created, location: @warmwork }
      else
        format.html { redirect_to :back, notice: 'Workout already has this warmup.' }
        format.json { render action: 'show', status: :created, location: @warmwork }
      end
    end
  end

  def update
    @warmwork.update(warmwork_params)
    respond_to do |format|
      if @warmwork.save
        format.html { redirect_to :back, notice: 'Warmwork was successfully updated.' }
        format.json { render action: 'show', status: :created, location: @warmwork }
      else
        format.html { redirect_to :back, notice: 'Warmwork was unsuccessfully updated.' }
        format.json { render action: 'show', status: :created, location: @warmwork }
      end
    end
  end

  def destroy
    @warmwork.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    def set_warmwork
      @warmwork = Warmwork.find(params[:id])
    end

    def warmwork_params
      params.require(:warmwork).permit(:warmup_id, :workout_id)
    end
end
