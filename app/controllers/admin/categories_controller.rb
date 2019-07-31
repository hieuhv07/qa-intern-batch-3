class Admin::CategoriesController < Admin::BaseController
	before_action :load_category, only: %i(edit update destroy)

	def index
		@categories = Category.newest
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new category_params
		if @category.save
			flash[:success] = t ".success"
			redirect_to admin_categories_path
		else
			flash.now[:danger] = t ".danger"
			render :new
		end
	end

	def edit; end

	def update
		if @category.update category_params
			flash[:success] = t ".success"
			redirect_to admin_categories_path
		else
			flash[:danger] = t ".danger"
			render :edit
		end
	end

	def destroy
		if @category.destroy
			flash[:success] = t ".success"
		else
			flash[:danger] = t ".danger"
		end
		redirect_to admin_categories_path
	end

	private

	def category_params
		params.require(:category).permit :name, :description
	end

	def load_category
		@category = Category.find params[:id]
	end
end