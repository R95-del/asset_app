class ItemsController < ApplicationController

  before_action :set_item_id, only: %i[edit show destroy update]
  include Items::ItemModule

  def index
    @items = Item.all

    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="items.xlsx"'
      }
    end
  end

  def new
    @item = Item.new
  end

  def create
    item_create
  end

  def edit
  end

  def update
    item_update
  end

  def show
    @brand = Brand.find_by_id(@item&.brand)
    @category = Category.find_by_id(@item&.category)
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.brand
      @item.brand.destroy
    end
    @item.destroy
    redirect_to items_url, flash: { success: "Item deleted." }
  end

  def export_pdf
    @items = Item.all
    respond_to do |format|
      format.pdf do
        pdf = ItemPdf.new(@items)
        send_data pdf.render, filename: 'items.pdf', type: 'application/pdf', disposition: 'inline'
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :minimum_required_stock, :quantity, :total_stock, :procurement_time_in_weeks, :brand_id, :category_id)
  end

  def set_item_id
    @item = Item.find(params[:id])
  end


end
