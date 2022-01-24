class OrderitemsController < ApplicationController
    def index
        #履歴カート
        @history = Order.where(member_id: current_member.id).where.not(status:1)
    end

    def show
        @orderitem = Orderitem.where(order_id: params[:id])
        @total = 0
    end
end