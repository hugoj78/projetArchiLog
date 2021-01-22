class TomesController < ApplicationController
  before_action :set_manga, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_tome, only: [:show, :edit, :update, :destroy]
  
  def index
    @tome = policy_scope(Tome)
  end
  def new
    @tome = Tome.new
    authorize @tome
  end

  def edit
  end
  
  def update
    @tome.update(tome_params)
    if @tome.save
      redirect_to manga_path(@manga)
    else
      render 'edit'
    end
  end

  def show
  end

  def create
    @tome = Tome.new(tome_params)
    @tome.user = current_user
    @tome.manga = @manga
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

  def set_tome
    @tome = Tome.find(params[:id])
    authorize @tome
  end


  def destroy
    Tome.destroy(params[:id])
    redirect_to manga_path(@manga)
  end

  private

  def tome_params
    params.require(:tome).permit(:title, :description, :photo)
  end
end
