names = ["デイリー食品", "生鮮", "加工食品", "飲料・菓子・アイス", "冷凍食品", "お米・お酒", "日用品・化粧品"]
0.upto(6) do |idx|
    Category.create(
      category_name: "#{names[idx]}"
    )
end