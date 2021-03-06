class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show, :destroy]

  def index
    @cocktails = Cocktail.all
    @cocktail = Cocktail.new
  end

  def show
    @doses = @cocktail.doses
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :index
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
