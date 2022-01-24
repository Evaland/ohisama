class Admin::OrdersController < Admin::Base
    before_action :current_cart
    before_action :admin_login_required
    
    def index
        @orders = Order.order("id")
    end
    
    def show
        @order = Order.find_by(member_id: params[:id])
        @orderitem = Orderitem.where(order_id: @order.id)
    end

    def edit
        @order = Order.find_by(id: params[:id])
        @member = Member.find_by(id: @order.member_id)
    end

    def update
        @order = Order.find(params[:id])
        @order.assign_attributes(params[:order])
        if Order.find_by(member_id: current_member.id, status:2)
            @cart = Order.new
            put "あああ"
            @cart.status = 1
            @cart.member_id = current_member.id
            @cart.save
        end
        if @order.save
          redirect_to :admin_orders, notice: "マイページを更新しました。"
        else
          render "edit"
        end
    end

end