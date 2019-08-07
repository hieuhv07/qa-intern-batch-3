class Admin::TagsController < Admin::BaseController
  before_action :current_tags, only: [:edit, :update, :destroy]

  def index
    @tags = Tag.all.order(:id)
    @tag = Tag.new
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    respond_to do |format|
      if @tag.save
        format.js { flash[:success] = "Create tag successfully!!!" }
      else
        format.js
      end
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    respond_to do |format|
      if @tag.update_attributes(name: params[:name])
        format.js { flash[:success] = "Update successfully!!!" }
      else
        format.js
      end
    end
  end

  def destroy
    @tag.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:user_id, :name)
  end

  def current_tags
    @tag = Tag.find_by(id: params[:id])
  end
end
