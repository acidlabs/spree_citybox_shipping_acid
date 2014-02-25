module Spree
  module Admin
    class CityboxOrdersController < ResourceController
      require 'write_xlsx'
      def index
        @q = Spree::CityboxOrder.search(params[:q])
        @collection = @q.result(distinct: true)

        if params[:commit] == 'Exportar'
          send_file(
            generate_excel(@collection),
            filename: "citybox_correosChile.xlsx",
            type: "application/xlsx"
            )
        end
      end

      private
      def generate_excel(collection)

        workbook = WriteXLSX.new('citybox_correosChile.xlsx')
        worksheet = workbook.add_worksheet
        col = row = 0
        collection.each_with_index do |object, r|
          worksheet.write(r, 0, object.customer_name)
          worksheet.write(r, 1, object.citybox_location)
          worksheet.write(r, 2, object.city)
          worksheet.write(r, 3, object.country)
          worksheet.write(r, 4, object.product)
          worksheet.write(r, 5, object.size)
          worksheet.write(r, 6, object.package ? 1 : 0)
          worksheet.write(r, 7, object.order.id)
          worksheet.write(r, 8, object.content)
          worksheet.write(r, 9, object.total)
          worksheet.write(r, 10, object.kilogram)
          worksheet.write(r, 11, object.volume)
          worksheet.write(r, 12, object.ship_address)
          worksheet.write(r, 13, object.ship_city)
          worksheet.write(r, 14, object.email)   
          worksheet.write(r, 15, object.phone)            
        end

        workbook.close

        send_file(
          "citybox_correosChile.xlsx",
          filename: "citybox_correosChile.xlsx",
          type: "application/xlsx"
          )
      end
    end
  end
end