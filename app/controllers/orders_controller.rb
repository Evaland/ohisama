class OrdersController < ApplicationController
    before_action :current_cart
    before_action :login_required

  
    def index
      @order = current_cart
      #注文済カート
      @orderitem = Orderitem.where(order_id: @order.id)
      @total = 0
      @total2 = 0
      @regular = Regular.where(member_id: current_member.id)
      
    end
    
    def show
      #履歴カート
      @history = Order.where(member_id: current_member.id).where.not(status:1)
      @orderitem = Orderitem.order(order_id: @histroy.id)
    end

    def create
      @order = Order.find(current_cart.id)
      @item = Item.find(params[:order][:item_ids].to_i)
      #[:order]は指定させて、params内は行列であることも忘れずに
      @orderitem = Orderitem.find_by(order_id: current_cart.id, item_id: params[:order][:item_ids].to_i)
      if @orderitem.present?
        @orderitem.increment(:orderitem_quantity, params[:order][:order_quantity].to_i)
      else
        #ここでorderitemを作成している
        @order.items << @item
        @orderitem = Orderitem.find_by(order_id: current_cart.id, item_id: params[:order][:item_ids].to_i)
        @orderitem.orderitem_quantity = params[:order][:order_quantity].to_i
      end
      if @item.item_quantity > params[:order][:order_quantity].to_i 
        @item.item_quantity -= params[:order][:order_quantity].to_i
        @orderitem.save
        @item.save
        redirect_to :categories, notice: 'カート内に商品が追加されました'
      else
        redirect_to :categories, notice: 'カート内に商品が追加できませんでした'
      end
    end

    def new
        @order = Order.new
    end
 
    def destroy
      @orderitem = Orderitem.find_by(id:params[:id])
      @item = Item.find_by(id:@orderitem.item_id)
      @item.item_quantity += @orderitem.orderitem_quantity
      if @orderitem.destroy
        @item.save
        redirect_to :orders, notice: 'カート内の商品が削除されました'
      else
        redirect_to :orders, notice:  '削除に失敗しました'
      end
    end

end
