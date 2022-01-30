0.upto(0) do |idx|
    Order.create(
        member_id: idx +1,
        status: 2,
        order_group:1
    )
end
0.upto(5) do |idx|
    Order.create(
        member_id: idx +2,
        status: 1,
        order_group:[3,1,2][idx % 3]
    )
end

6.upto(8) do |idx|
    Order.create(
        member_id: idx +2,
        status: 1,
        order_group:[1,2,3][idx % 3]
    )
end