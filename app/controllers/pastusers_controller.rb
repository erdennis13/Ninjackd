class PastusersController < ApplicationController
  before_action :set_pastuser, only: [:show, :edit, :update, :destroy]

  def index
    @pastusers = Pastuser.all
  end

  def show
  end

  def new
    @pastuser = Pastuser.new
  end

  def edit
  end

  def create
    @pastuser = Pastuser.new(pastuser_params)
    @pastuser.save
  end

  def update
    @pastuser.update(pastuser_params)
  end

  def destroy
    @pastuser.destroy
  end

  private
    def set_pastuser
      @pastuser = Pastuser.find(params[:id])
    end

    def pastuser_params
      params.require(:pastuser).permit(:username, :email)
    end
end
