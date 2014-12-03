class DailytipsController < ApplicationController
  before_action :set_dailytip, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.try(:admin)
      @dailytips = Dailytip.all.order("show_date DESC").paginate(:page => params[:page], :per_page => 10)
    else
      @dailytips = Dailytip.where('show_date <= ?', Date.today).all.order("show_date DESC").paginate(:page => params[:page], :per_page => 10)
    end
  end

  def show
  end

  def new
    @dailytip = Dailytip.new
  end

  def edit
  end

  def tipofday
    @dailytips = Dailytip.all
  end

  def create
    @dailytip = Dailytip.new(dailytip_params)
    respond_to do |format|
      if @dailytip.save
        format.html { redirect_to @dailytip, notice: 'Dailytip was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dailytip }
      else
        format.html { redirect_to @dailytip, notice: "Dailytip was unsucessfully created." }
        format.json { render action: 'show', status: :created, location: @dailytip }
      end
    end
  end

  def update
    @dailytip.update(dailytip_params)
    respond_to do |format|
      if @dailytip.save
        format.html { redirect_to @dailytip, notice: 'Dailytip was successfully updated.' }
        format.json { render action: 'show', status: :created, location: @dailytip }
      else
        format.html { redirect_to @dailytip, notice: "Dailytip was unsucessfully updated." }
        format.json { render action: 'show', status: :created, location: @dailytip }
      end
    end
  end

  def destroy
    @dailytip.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    def set_dailytip
      @dailytip = Dailytip.find(params[:id])
    end

    def dailytip_params
      params.require(:dailytip).permit(:tip, :user_id, :show_date)
    end
end
