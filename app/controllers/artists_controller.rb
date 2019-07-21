class ArtistsController < ApplicationController
  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to new_admin_product_path
    else
      render :new
    end
  end

  private
  def artist_params
    params.require(:artist).permit(:artist)
  end
end
