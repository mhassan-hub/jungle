class Admin::CategoriesController < ApplicationController
  def index
    @category = Category.all
    @products = @category.products
  end

  def new
  end

  def create
  end
end
