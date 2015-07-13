class MusicfilesController < ApplicationController
  before_action :set_musicfile, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  def index
    @musicfiles = Musicfile.all
  end


  def show
  end

  def new
    @musicfile = current_user.musicfiles.build
  end


  def edit
  end

  def create
    @musicfile = current_user.musicfiles.build(musicfile_params)

   # respond_to do |format|
      if @musicfile.save
        redirect_to @musicfile, notice: 'Music File was successfully created.'
      else
        render :new
      end
    end
  end

  # PATCH/PUT /musicfiles/1
  # PATCH/PUT /musicfiles/1.json
  def update
      if @musicfile.update(musicfile_params)
        redirect_to @musicfile, notice: 'Music File was successfully updated.'
      else
        render :edit
      end
    end


  def destroy
    @musicfile.destroy
      redirect_to musicfiles_url, notice: 'Music File was successfully destroyed.'
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_musicfile
      @musicfile = Musicfile.find(params[:id])
    end

    def correct_user
      @musicfile = current_user.musicfiles.find_by(params[:id])
      redirect_to musicfiles_path, notice: "Not authorized to edit this file" if @musicfile.nil?
    end 
    # Never trust parameters from the scary internet, only allow the white list through.
    def musicfile_params
      params.require(:musicfile).permit(:description)
    end

