class SongsController < ApplicationController
  def new
    @song = Song.new(song_params)
  end

  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find_by(params[:id])
  end

  def edit
    @song = Song.find_by(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
end