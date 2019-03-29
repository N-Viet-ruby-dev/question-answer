class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.paginate page: params[:page], per_page: 10
    @total = Category.all.count
  end

  def show
    @category = Category.find params[:id]
  end

  def edit
    @category = Category.find params[:id]
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    flash[:success] = "New category created!" if @category.save
    redirect_to new_admin_category_path
  end

  def update
    @category = Category.find params[:id]
    flash[:success] = "Category updated!" if @category.update category_params
    redirect_to edit_admin_category_path(@category)
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    flash[:success] = "Category deleted!"
    redirect_to admin_categories_url
  end

  private

  def category_params
    params.require(:category).permit :title, :body
  end
end
