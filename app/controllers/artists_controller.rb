class ArtistsController < ApplicationController
  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.save
    redirect_to :back
  end

  private
  def artist_params
    params.require(:artist).permit(:artist)
  end
end
