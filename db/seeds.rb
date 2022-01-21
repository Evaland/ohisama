table_names = %w(members categories items orders) # ほかに入れたいテーブルがあれば、ここに空白区切りで追加して、rbファイルも作る
table_names.each do |table_name|
  path = Rails.root.join("db/seeds", Rails.env, table_name + ".rb")
  if File.exist?(path)
    puts "Creating #{table_name}..."
    require path
  end
end