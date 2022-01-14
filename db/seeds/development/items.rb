names = ["牛乳", "卵", "ほうれん草", "トマト","とうもろこし", "あじ","さんま","ヨーグルト","クリームシチュー"]
0.upto(8) do |idx|
    Item.create(
      item_name: "#{names[idx]}",
      price: 100,
      item_quantity: 100,
      disable: true
    )
end