class UserreviewsController < ApplicationController
  before_action :set_userreview, only: [:show, :edit, :update, :destroy]

  def index
    @userreviews = Userreview.all
  end

  def show
  end

  def new
    @userreview = Userreview.new
  end

  def edit
  end

  def create
    @userreview = Userreview.new(userreview_params)
    respond_to do |format|
      if @userreview.save
        format.html { redirect_to @userreview, notice: 'Review was successfully created.' }
        format.json { render action: 'show', status: :created, location: @userreview }
      else
        format.html { redirect_to @userreview, notice: "Review was unsucessfully created." }
        format.json { render action: 'show', status: :created, location: @userreview }
      end
    end
  end

  def update
    @userreview.update(userreview_params)
    respond_to do |format|
      if @userreview.save
        format.html { redirect_to @userreview, notice: 'Review was successfully updated.' }
        format.json { render action: 'show', status: :created, location: @userreview }
      else
        format.html { redirect_to @userreview, notice: "Review was unsucessfully updated." }
        format.json { render action: 'show', status: :created, location: @userreview }
      end
    end
  end

  def destroy
    @userreview.destroy
    respond_to do |format|
      format.html { redirect_to userreviews_url }
      format.json { head :no_content }
    end
  end

  private
    def set_userreview
      @userreview = Userreview.find(params[:id])
    end

    def userreview_params
      params.require(:userreview).permit(:user_id, :review)
    end
end
