class MusicFilesController < ApplicationController
  before_action :set_music_file, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

def index
  @music_files = MusicFile.all
end

def show
  @music_file = MusicFile.find(params[:id])
end

def new
  @music_file = current_user.music_files.build
end

def edit
  @music_file = MusicFile.find(params[:id])    
end

def create
  @music_file = current_user.music_files.build(music_file_params)
  if @music_file.save
    redirect_to @music_file, notice: 'music file was successfully uploaded.'
  else
    render :new
  end
end

def update
  @music_file = MusicFile.find(params[:id])    
  if @music_file.update(music_file_params)
    redirect_to @music_file, notice: 'music file was successfully updated.'
  else
    render :edit
  end
end

def destroy
  @music_file = MusicFile.find(params[:id])
  @music_file.destroy
  redirect_to music_files_url, notice: 'music file was successfully destroyed.'
  end

private
  def set_music_file
    @music_file = MusicFile.find(params[:id])
  end

  def correct_user
    @music_file = current_user.music_files.find_by(params[:id])
    redirect_to music_files_path, notice: "not authorized to edit this file" if @music_file.nil?
    end 
    # Ensure correct parameters are entered
  def musicfile_params
    params.require(:musicfile).permit(:description, :audio)
  end
end

