class WarmupsController < ApplicationController
  before_action :set_warmup, only: [:show, :edit, :update, :destroy]

  def index
    @warmups = Warmup.all
  end

  def show
  end

  def new
    @warmup = Warmup.new
  end

  def edit
  end

  def create
    @warmup = Warmup.new(warmup_params)
    respond_to do |format|
      if @warmup.save
        format.html { redirect_to @warmup, notice: 'Warmup was successfully created.' }
        format.json { render action: 'show', status: :created, location: @warmup }
      else
        format.html { redirect_to @warmup, notice: 'Warmup was unsuccessfully created.' }
        format.json { render action: 'show', status: :created, location: @warmup }
      end
    end
  end

  def update
    @warmup.update(warmup_params)
    respond_to do |format|
      if @warmup.save
        format.html { redirect_to @warmup, notice: 'Warmup was successfully updated.' }
        format.json { render action: 'show', status: :created, location: @warmup }
      else
        format.html { redirect_to @warmup, notice: 'Warmup was unsuccessfully updated.' }
        format.json { render action: 'show', status: :created, location: @warmup }
      end
    end
  end

  def destroy
    @warmup.destroy
    respond_to do |format|
      format.html { redirect_to warmups_url }
      format.json { head :no_content }
    end
  end

  private
    def set_warmup
      @warmup = Warmup.find(params[:id])
    end

    def warmup_params
      params.require(:warmup).permit(:name, :description)
    end
end
