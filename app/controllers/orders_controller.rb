class OrdersController < ApplicationController
    before_action :current_cart
    before_action :login_required

  
    def index
        @order = current_cart
        @orderitems = Orderitem.order("item_id")
    end
    
    def show
      @order = Order.find(member_id: current_member.id, status:1)
      @orderitem = Orderitem.order(id)
    end

    def create
      @order = current_cart
      @order.items << Item.find_by(id: params[:id].to_i)
      @orderitem = Orderitem.find(orderitem_quantity)
      if @orderitem.orderitem_quantity.blank?
        @orderitem.orderitem_quantity = 0
      end
        @orderitem.orderitem_quantity += params[:orderitem_quantity].to_i
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
