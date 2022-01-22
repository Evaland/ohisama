class OrdersController < ApplicationController
    before_action :current_cart
    before_action :login_required

  
    def index
        @order = current_cart
        @orderitem = Orderitem.where(order_id: @order.id)
        @total = 0
    end
    
    def show
      @order = Order.find(member_id: current_member.id, status:1)
      @orderitem = Orderitem.order(id)
    end

    def create
      @order = Order.find(current_cart.id)
      @item = Item.find(params[:order][:item_ids].to_i)
      @order.items << @item
      @orderitem = Orderitem.find_by(order_id: current_cart.id, item_id: params[:order][:item_ids].to_i)
      @orderitem.orderitem_quantity = params[:order][:order_quantity].to_i
      if @orderitem.save
        redirect_to :categories, notice: 'カート内に商品が追加されました'
      else
        render "new", notice: 'カート内に商品が追加できませんでした'
      end
    end

    def new
        @order = Order.new
    end
 
    def destroy_item
      @orderitem = Orderitem.find_by(params[:id])
      if @orderitem.destroy
        redirect_to orders, notice: 'カート内の商品が削除されました'
      else
        redirect_to orders, notice:  '削除に失敗しました'
      end
    end

    def destroy_cart
      @order = Order.find_by("id")
      if @order.destroy
        redirect_to orders, notice: 'カートが削除されました'
      else
        redirect_to orders, notice: '削除に失敗しました'
      end
    end
end
