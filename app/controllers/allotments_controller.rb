class  AllotmentsController < ApplicationController
  before_action :set_allotments_id, only: %i[edit show deallot update]

  include Allotments::AllotmentModule

  def index
    @allotments = Allotment.all

    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="allotments.xlsx"'
      }
    end
  end

  def new
    @allotment = Allotment.new
    @non_admins = User.where(admin: false)
  end

  def create
    @allotment = Allotment.new(allotment_params)
    create_allotment
  end

  def show
  end

  def edit
  end

  def update
    update_in_stock
    if @allotment.item.save && @allotment.update(update_quantity_params)
      redirect_to edit_allotment_path, flash: { warning: "Updated" }
    else
      render 'edit'
    end
  end

  def deallot
    deallot_allotment
  end

  def export_pdf
    @allotments = Allotment.all
    respond_to do |format|
      format.pdf do
        pdf = AllotmentPdf.new(@allotments)
        send_data pdf.render, filename: 'allotments.pdf', type: 'application/pdf', disposition: 'inline'
      end
    end
  end

  private

  def allotment_params
    params.require(:allotment).permit(:user_id, :item_id, :category_id, :allotment_quantity)
  end

  def set_allotment
    @allotment = Allotment.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to allotments_path, flash: { error: "Allotment not found" }
  end

  def update_quantity_params
    params.require(:allotment).permit(:allotment_quantity)
  end

end
