class MangasController < ApplicationController
	before_action :set_manga, only: [:show, :edit, :update, :destroy]
	def index
		@mangas = policy_scope(Manga)
	end

	def show
	end

	def new
		@manga = Manga.new
		authorize @manga
	end

	def create
		@manga = Manga.new(manga_params)
		authorize @manga
		if @manga.save
			redirect_to manga_path(@manga)
		else
			render 'new'
		end
	end
	def edit
	end

	def update
		@manga.update(manga_params)
		redirect_to manga_path(@manga)
	end

	def set_manga
		@manga = Manga.find(params[:id])
		authorize @manga
	end

	def destroy
		Manga.destroy(params[:id])
    	redirect_to manga_path
	end

	private

	def manga_params
		params.require(:manga).permit(:name, :description, :auteur)
	end
end
