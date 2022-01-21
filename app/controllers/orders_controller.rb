class OrdersController < ApplicationController
    before_action :current_cart
  
    def index
        @order = current_cart
    end
    
    def show
      @orderitem = Orderitem.new(params[:orderitem])
      @order = Order.find(params[:id])
    end

    def create
      @order = current_cart
      @order.items << Item.find_by(id: params[:member_id].to_i)
      @orderitem = Orderitem.find_by(orderitem_quantity: @order.order_quantity)
      if @orderitem.save
        redirect_to @order, notice: 'カート内に商品が追加されました'
      else
        redirect_to @order, notice: 'カート内に商品が追加できませんでした'
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
