class MangasController < ApplicationController
	before_action :set_manga, only: [:show, :edit, :update, :destroy] 

	def index
		@researchs = policy_scope(Manga)
		if params[:search]
			@researchs = Manga.search(params[:search])
		else
			@researchs = Manga.all
		end
	end

	def show
	end

	def new
		@manga = Manga.new
		authorize @manga
	end

	def create
		@manga = Manga.new(manga_params)
		@manga.user = current_user
		authorize @manga
		if @manga.save
			TomeJob.perform_now(@manga, current_user)
			#TomeJob.perform_later(@manga, current_user)
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
		#MangaJob.perform_now(params[:id])
		Manga.destroy(params[:id])
    	redirect_to mangas_path
	end

	private

	def manga_params
		params.require(:manga).permit(:name, :description, :auteur, :photo)
	end
end
