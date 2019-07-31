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
			flash[:success] = "ok"
			redirect_to admin_categories_path
		else
			flash.now[:danger] = "loi"
			render :new
		end
	end

	def edit; end

	def update
		if @category.update category_params
			flash[:success] = "ok"
			redirect_to admin_categories_path
		else
			flash[:danger] = "loi"
			render :edit
		end
	end

	def destroy
		if @category.destroy
			flash[:success] = "ok"
		else
			flash[:danger] = "loi"
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