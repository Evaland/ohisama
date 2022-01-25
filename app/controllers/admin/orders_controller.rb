class Admin::OrdersController < Admin::Base
    before_action :current_cart
    before_action :admin_login_required
    
    def index
        @member = Member.order("id")
    end
    
    def show
        @orders = Order.order("id")
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
        if @order.save
          redirect_to :admin_orders, notice: "マイページを更新しました。"
        else
          render "edit"
        end
    end

end