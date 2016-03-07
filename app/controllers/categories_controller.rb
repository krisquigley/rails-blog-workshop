class CategoriesController < ApplicationController
  expose(:category, finder: :find_by_slug, attributes: :category_params)
  expose(:categories)
  
  def new
  end

  def create
    if category.save
      flash[:notice] = "Category Successfully Created - #{category.name}"
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
      flash[:notice] = "Category Edited - #{category.name}"
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    if category.destroy
      flash[:notice] = "Category Deleted - #{category.name}"
      redirect_to categories_path
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end