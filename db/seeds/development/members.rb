fnames = ["佐藤", "鈴木", "高橋"]
names = ["sato", "suzuki", "takahasi"]
0.upto(2) do |idx|
    Member.create(
      name: "#{fnames[idx]}",
      adress: "川崎市多摩区",
      user_id: "#{names[idx]}1234",
      group: [1, 2, 3][idx % 3],
      regular_member: false,
      password: "ohisama!",
      password_confirmation: "ohisama!"
    )
  end