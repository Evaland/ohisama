names = ["魚", "青果", "ベーカりー", "肉"]
0.upto(3) do |idx|
    Category.create(
      category_name: "#{names[idx]}"
    )
end