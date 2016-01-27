class Order < ActiveRecord::Base
	has_many :line_items

	def order_total_price
		line_items.to_a.sum{ |line_item| line_item.total_price}
	end
end
