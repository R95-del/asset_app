class AllotmentPdf < Prawn::Document
  def initialize(allotments)
    super()
    @allotments = allotments
    header
    text_content
    table_content
  end

  def header
    text "Allotments List", size: 30, style: :bold
  end

  def text_content
    move_down 20
    text "This PDF contains a list of all allotments in the system.", size: 15
  end

  def table_content
    move_down 20
    table table_data do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
    end
  end

  def table_data
    [['User', 'Item', 'Allotment Quantity', 'Dealloted At']] +
      @allotments.map do |allotment|
        [
          allotment.user&.name || "N/A",
          allotment.item&.name || "N/A",
          allotment.allotment_quantity,
          allotment.dealloted_at.present? ? allotment.dealloted_at.strftime("%d-%m-%Y") : "N/A"
        ]
      end
  end
end
