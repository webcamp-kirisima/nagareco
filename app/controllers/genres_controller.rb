class GenresController < ApplicationController
  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to new_admin_product_path(current_user)
  end

  private
  def genre_params
    params.require(:genre).permit(:genre)
  end
end
