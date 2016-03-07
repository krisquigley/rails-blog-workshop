class CategoriesController < ApplicationController
  expose(:category, finder: :find_by_slug, attributes: :category_params)
  expose(:categories)
  
  def new
  end

  def create

    if category.save
      flash.notice = "#{category.name} Category created"
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
    if category.save
      flash.notice = "#{category.name} Category updated"
    else 
      flash.notice = "#{category.name} Could not save. Please throw computer at wall."
    end
  end

  def update
    if category.save
      flash.notice = "#{category.name} Category updated"
      redirect_to categories_path
    else
      flash.notice = "#{category.name} Could not save. Please throw computer at wall."
      render :edit
    end
  end

  def destroy
    category.destroy
    if category.destroy
      flash.notice = "#{category.name} category deleted"
    end
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end