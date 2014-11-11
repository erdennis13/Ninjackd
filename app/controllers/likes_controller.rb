class LikesController < ApplicationController
  before_action :set_like, only: [:show, :edit, :update, :destroy]

  def index
    @likes = Like.all
  end

  def show
  end

  def new
    @like = Like.new
  end

  def edit
  end

  def create
    @like = Like.new(like_params)
    respond_to do |format|
      if @like.save
        format.html { redirect_to :back, notice: 'Like was successfully created.' }
        format.json { render action: 'show', status: :created, location: @like }
      else
        format.html { redirect_to :back, notice: "You already liked this!" }
        format.json { render action: 'show', status: :created, location: @like }
      end
    end
  end

  def update
    @like.update(like_params)
    respond_to do |format|
      if @like.save
        format.html { redirect_to @like, notice: 'Like was successfully updated.' }
        format.json { render action: 'show', status: :created, location: @like }
      else
        format.html { redirect_to @like, notice: 'Like was unsuccessfully updated.' }
        format.json { render action: 'show', status: :created, location: @like }
      end
    end
  end

  def destroy
    @like.destroy
    respond_to do |format|
      format.html { redirect_to likes_url }
      format.json { head :no_content }
    end
  end

  private
    def set_like
      @like = Like.find(params[:id])
    end

    def like_params
      params.require(:like).permit(:user_id, :workout_id)
    end
end
