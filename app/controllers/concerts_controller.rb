class ConcertsController < ApplicationController
  def new
    @concert = Concert.new
    # render :new
  end

  def create
    @concert = Concert.new(concert_params)

    if @concert.save
      redirect_to concert_path(@concert)
    else
      render :new
    end
  end

  def show
    @concert = Concert.find(params[:id])
    # render :show
  end


  private

  def concert_params
    params.require(:concert).permit(:artist, :venue, :city, :start_date, :price, :description)
  end
end
