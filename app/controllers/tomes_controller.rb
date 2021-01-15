class TomesController < ApplicationController
  before_action :set_manga, only: [:new, :create]
  def index
    @tome = policy_scope(Tome)
  end
  def new
    @tome = Tome.new
    authorize @tome
  end

  def create
    @tome = Tome.new(tome_params)
    @tome.manga = @manga
    authorize @tome
    if @tome.save
      redirect_to manga_path(@manga)
    else
      render 'new'
    end
  end

  def set_manga
    @manga = Manga.find(params[:manga_id])
    authorize @manga
  end

  private

  def tome_params
    params.require(:tome).permit(:title, :description)
  end
end
