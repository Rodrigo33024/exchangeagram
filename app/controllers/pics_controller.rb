class PicsController < ApplicationController
  before_action :find_pic, only: [:show, :edit, :update, :destroy]
  def index
    @pics = Pic.all
  end

  def new
    @pic = Pic.new
  end

  def show
  end

  def create
    @pic = Pic.new(pics_params)

    if @pic.save
      redirect_to @pic, notice: 'Picture was saved'
    else
      render 'new'
    end
  end

  private

  def pics_params
    params.require(:pic).permit(:title, :description)
  end

  def find_pic
    @pic = Pic.find(params[:id])
  end
end
