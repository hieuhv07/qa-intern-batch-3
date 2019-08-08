class TagsController < ApplicationController
  def index
    @tags = Tag.select(:name)
    render json: @tags
  end
end
