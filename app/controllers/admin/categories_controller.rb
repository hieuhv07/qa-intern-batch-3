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
      redirect_to admin_categories_path, success: t(:success)
    else
      render :new, danger: t(:danger)
    end
  end

  def edit; end

  def update
    if @category.update category_params
      redirect_to admin_categories_path, success: t(:success)
    else
      render :new, danger: t(:danger)
    end
  end

  def destroy
    if @category.destroy
      redirect_to admin_categories_path, success: t(:success)
    else
      redirect_to admin_categories_path, danger: t(:danger)
    end
  end

  private

  def category_params
    params.require(:category).permit :name, :description
  end

  def load_category
    @category = Category.find params[:id]
  end
end
