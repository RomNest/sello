class CategoriesController < ApplicationController	
	skip_before_filter :verify_authenticity_token
	before_action :find_category, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:show]

	def show
	end

	def new
		@category = Category.new
	end

	def edit
	end

	def create
		@category = Category.new(category_params)

		if @category.save
			redirect_to @category, notice: "Hey, #{current_user}. Your category was successfully created."
		else
			render 'new'
		end
	end

	def update

		if @category.update(category_params)
			redirect_to @category, notice: "Hey, #{current_user}. Your category was successfully updated."
		else
			render 'edit'
		end
	end

	def destroy
		@category.destroy

		redirect_to categories_path
	end

	private
		def find_category
			@category = Category.find(params[:id]) 
		end

		def category_params
			params.require(:category).permit(:name)
		end
end
