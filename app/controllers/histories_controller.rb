class HistoriesController < ApplicationController
  before_action :set_history, only: [:show, :edit, :update, :destroy]

  def index
    @histories = History.all
  end

  def show
  end

  def new
    @history = History.new
  end

  def edit
  end

  def create
    @history = History.new(history_params)
    respond_to do |format|
      if @history.save
        format.html { redirect_to @history, notice: 'Histoy was successfully created.' }
        format.json { render action: 'show', status: :created, location: @history }
      else
        format.html { redirect_to @history, notice: 'History was unsuccessfully created.' }
        format.json { render action: 'show', status: :created, location: @history }
      end
    end
  end

  def update
    @history.update(history_params)
    respond_to do |format|
      if @history.save
        format.html { redirect_to @history, notice: 'Histoy was successfully updated.' }
        format.json { render action: 'show', status: :created, location: @history }
      else
        format.html { redirect_to @history, notice: 'History was unsuccessfully updated.' }
        format.json { render action: 'show', status: :created, location: @history }
      end
    end
  end

  def destroy
    @history.destroy
    respond_to do |format|
      format.html { redirect_to histories_url }
      format.json { head :no_content }
    end
  end

  private
    def set_history
      @history = History.find(params[:id])
    end

    def history_params
      params.require(:history).permit(:subscription_id, :exercise_id, :complete)
    end
end
