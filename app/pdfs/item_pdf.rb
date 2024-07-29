class ItemPdf
  require 'prawn'
  require 'prawn/table'

  def initialize(items)
    @items = items
  end

  def render
    Prawn::Document.new do |pdf|
      pdf.text "Items", size: 30, style: :bold
      pdf.move_down 20

      table_data = [['name', 'description', 'in_stock', 'price', 'minimum_required_stock', 'quantity', 'total_stock', 'procurement_time_in_weeks', 'brand_id', 'category_id']]
      @items.each do |item|
        table_data << [item.name, item.description, item.in_stock, item.price, item.minimum_required_stock, item.quantity, item.total_stock, item.procurement_time_in_weeks, item.brand&.name, item.category&.name]
      end

      pdf.table(table_data, header: true, row_colors: ['DDDDDD', 'FFFFFF'])
    end.render
  end
end
