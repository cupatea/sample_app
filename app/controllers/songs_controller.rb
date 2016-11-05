class SongsController < ApplicationController
  attr_accessor :song

  def index
    @songs =Song.all
  end

  def new
     @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
       flash[:success] = "Song created!"
    end
    redirect_to songs_url
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_url
    flash[:success] = "Song deleted"
  end
  private
      def song_params
      params.require(:song).permit(:artist, :name, :path)
   end

end
