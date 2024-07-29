class BrandPdf
  require 'prawn'
  require 'prawn/table'

  def initialize(brands)
    @brands = brands
  end

  def render
    Prawn::Document.new do |pdf|
      pdf.text "Brands", size: 30, style: :bold
      pdf.move_down 20

      table_data = [['name', 'manufacturer', 'manufacturer_email', 'manufacturer_office']]
      @brands.each do |brand|
        table_data << [brand.name, brand.manufacturer, brand.manufacturer_email, brand.manufacturer_office]
      end
      pdf.table(table_data, header: true, row_colors: ['DDDDDD', 'FFFFFF'])
    end.render
  end
end
