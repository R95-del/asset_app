class CategoryPdf
  require 'prawn'
  require 'prawn/table'

  def initialize(categories)
    @categories = categories
  end

  def render
    Prawn::Document.new do |pdf|
      pdf.text "Categories", size: 30, style: :bold
      pdf.move_down 20

      table_data = [['name', 'description']]
      @categories.each do |category|
        table_data << [category.name, category.description]
      end

      pdf.table(table_data, header: true, row_colors: ['DDDDDD', 'FFFFFF'])
    end.render
  end
end
