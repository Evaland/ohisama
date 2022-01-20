fnames = ["佐藤 惟政", "鈴木 結城", "高橋 型","石川 聡" ,"鈴木 佑介", "小林 大樹","吉田 太一", "佐藤 達郎"]
names = ["sato", "suzuki", "takahasi", "isikawa", "suzuki", "kobayasi", "yosida", "sato"]
0.upto(0) do |idx|
  Member.create(
    name: "管理者",
    adress: "000000000",
    user_id: "admin",
    group: 1,
    regular_member: false,
    admin_member: true,
    password: "admin!",
    password_confirmation: "admin!"
  )
end
0.upto(7) do |idx|
    Member.create(
      name: "#{fnames[idx]}",
      adress: "川崎市多摩区登戸 1-2-3-4",
      user_id: "#{names[idx]}#{idx}",
      group: [1, 2, 3][idx % 3],
      regular_member: false,
      admin_member: false,
      password: "ohisama!",
      password_confirmation: "ohisama!"
    )
  end

