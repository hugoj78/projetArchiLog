class ResearchsController < ApplicationController

    def show
        @researchs = Manga.all
        authorize @researchs
        if params[:search]
        @researchs = Manga.search(params[:search])
        else
        @researchs = Manga.all
        end
    end
    
end
