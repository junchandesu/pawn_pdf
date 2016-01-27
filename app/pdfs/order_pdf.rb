class OrderPDF < Prawn::Document
	attr_accessor :order
	def initialize(order)
		super()
		@order = order
		font "vendor/fonts/ipaexm.ttf"
		# text "こんにちは, Prawn!! on order_pdf.rb"
		# show header 
		header
		header_leader
		table_content
	end

	def header
		text "Order", size: 28
		# set up stroke color and line
		stroke_color "eeeeee"
		stroke_line [0, 680], [530, 680]
	end

	def header_leader
		# set a cursor
		y_position = cursor - 30

		# specify bounding_box location, use text 
		bounding_box([100, y_position], width: 270, height: 50) do 
			font_size 10.5
			text "Order Number:  #{@order.id}"
			move_down 3
			text " Order Date: #{@order.purchased_at}"
		end
	end

	def table_content
		 table line_item_rows do
			cells.padding = 8
			cells.borders = [:bottom,]   # 表示するボーダーの向き(top, bottom, right, leftがある)
			cells.border_width = 0.5
			
			row(0).border_width = 1.5
			row(-2).border_width = 1.5
			row(-1).background_color = "f0ad4e"
			row(-1).borders = []

			self.header = true
			self.row_colors = ['dddddd', 'ffffff']
			self.column_widths = [50, 200, 100, 70, 100]			
		end
	end

	def line_item_rows
		arr = [["#", "Item Name", "Unit Price", "Quantity", "Sub total"]]
		@order.line_items.map.with_index do |item, i|
			arr << [i+1, item.product_name, item.price, item.quantity, item.total_price]
		end
		arr << ["", "", "", "Grand Total", @order.order_total_price]
		return arr
	end

end

   
