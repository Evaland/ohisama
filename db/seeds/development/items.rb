names = ["牛乳", "卵", "ほうれん草"]
0.upto(2) do |idx|
    Item.create(
      item_name: "#{names[idx]}",
      price: 100,
      item_quantity: 100,
      disable: false
    )
end