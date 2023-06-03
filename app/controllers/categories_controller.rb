class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.categories.includes(:user)
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)

    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new, notice: 'Category could not be created.'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
