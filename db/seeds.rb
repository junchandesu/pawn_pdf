order1 = Order.create! purchased_at: 3.days.ago
order2 = Order.create! purchased_at: 2.days.ago
order3 = Order.create! purchased_at: 1.days.ago

LineItem.create! order_id: order1.id, product_name: "ノートPC", price: 50000, quantity: 1
LineItem.create! order_id: order1.id, product_name: "DVDプレイヤー", price: 5000, quantity: 1
LineItem.create! order_id: order1.id, product_name: "電子書籍Reader", price: 10000, quantity: 1 
LineItem.create! order_id: order1.id, product_name: "単三電池", price: 100, quantity: 3 