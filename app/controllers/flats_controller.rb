class FlatsController < ApplicationController
  before_action :find_flat, only: %i[show edit update destroy]
  def index
    if params[:name]
      @flats = Flat.where("name LIKE '%#{params[:name]}%'")
    else
      @flats = Flat.all
    end
  end

  def show
    # shows one flat
  end

  def new
    # form is displayed
    @flat = Flat.new
  end

  def create
    #creating a flat and redirected to index page
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flats_path
    else
      render :new
    end
  end

  def edit
    # form to edit flat info
  end

  def update
    # updating flat and redirecting to show page
    if @flat.update(flat_params)
      redirect_to flat_path(@flat)
    else
      render :edit
    end
  end

  def destroy
    # deleting a flat
    @flat.destroy
    redirect_to flats_path
  end

  def search
  end

  private

  def find_flat
    @flat = Flat.find(params[:id].to_i)
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end
end
