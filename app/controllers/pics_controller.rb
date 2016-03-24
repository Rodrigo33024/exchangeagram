class PicsController < ApplicationController
  def index
  end

  def new
    @pic = Pic.new
  end

  def create
    @pic = Pic.new(pics_params)

    if @pic.save
      redirect_to @pic
    else
      render 'new'
    end
  end

  private

  def pics_params
    params.require(:pic).permit(:title, :description)
  end
end
