class ReviewsController < ApplicationController
  before_action :set_tome, only: [:new, :edit, :update, :create]
  before_action :set_review, only: [:show, :edit, :update]

 	def index
  	@review = policy_scope(review)
	end

	def new
  	@review = Review.new
  	authorize @review
	end

	def show
	end

  def edit
  end

  def update
    @review.update(review_params)
    if @review.save
      redirect_to tome_path(@tome)
    else
      render 'edit'
    end
  end

	def create
  	@review = Review.new(review_params)
  	@review.tome = @tome
  	@review.user = current_user
  	if @review.save
    	redirect_to tome_path(@tome)
  	else
    	render 'new'
  	end
	end

	def set_tome
  	@tome = Tome.find(params[:tome_id])
  	authorize @tome
	end

	def set_review
  	@review = Review.find(params[:id])
  	authorize @review
	end

	private

	def review_params
  	params.require(:review).permit(:description, :rating)
	end
end