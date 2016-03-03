class CategoriesController < ApplicationController
  expose(:category, finder: :find_by_slug, attributes: :category_params)
  expose(:categories)
  
  def new
  end

  def create
    if category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def show
  end

  def index
  end

  def edit
  end

  def update
    if category.save
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    category.destroy
    
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end