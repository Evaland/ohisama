0.upto(6) do |idx|
    Order.create(
        member_id: idx +1,
        status: 1
    )
end
7.upto(7) do |idx|
    Order.create(
        member_id: idx +1,
        status: 2
    )
end