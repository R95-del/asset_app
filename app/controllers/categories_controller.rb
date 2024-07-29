class CategoriesController < ApplicationController

  before_action :set_category_id, only: %i[edit update show destroy]

  def index
    @categories = Category.all

    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="categories.xlsx"'
      }
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category, flash: {success: "Category was successfully created"}
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def update
    if @category.update(category_params)
      redirect_to @category, flash: {success: "Category was successfully updated"}
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to category_path
  end

  def export_pdf
    @categories = Category.all
    respond_to do |format|
      format.pdf do
        pdf = CategoryPdf.new(@categories)
        send_data pdf.render, filename: 'categories.pdf', type: 'application/pdf', disposition: 'inline'
      end
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

  def set_category_id
    @category = Category.find(params[:id])
  end
end
