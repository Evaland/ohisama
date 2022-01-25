Regular.create(
    member_id: Member.find_by(id: 7).id,
    regular_quantity: 1,
    item_id: Item.find_by(item_name: "牛乳").id
)
Regular.create(
    member_id: Member.find_by(id: 7).id,
    item_id: Item.find_by(item_name: "卵").id,
    regular_quantity: 1
)
Regular.create(
    member_id: Member.find_by(id: 8).id,
    regular_quantity: 1,
    item_id: Item.find_by(item_name: "牛乳").id
)
Regular.create(
    member_id: Member.find_by(id: 8).id,
    item_id: Item.find_by(item_name: "卵").id,
    regular_quantity: 1
)
Regular.create(
    member_id: Member.find_by(id: 9).id,
    regular_quantity: 1,
    item_id: Item.find_by(item_name: "牛乳").id
)
Regular.create(
    member_id: Member.find_by(id: 9).id,
    item_id: Item.find_by(item_name: "卵").id,
    regular_quantity: 1
)
