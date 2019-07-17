class ArtistsController < ApplicationController
  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.save
  end

  private
  def artist_params
    params.require(:artist).permit(:artist)
  end
end
