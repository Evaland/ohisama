class OrdersController < ApplicationController
    before_action :current_cart
    before_action :login_required

  
    def index
      @order = current_cart
      #注文済カート
      @orderitem = Orderitem.where(order_id: @order.id)
      @total = 0
      @member = current_member
      @egg = Item.find_by(item_name: "卵")
      @milk = Item.find_by(item_name: "牛乳")
      @regular_egg = Regular.where(item_id: @egg.id,member_id: @member.id).first
      @regular_milk = Regular.where(item_id: @milk.id,member_id: @member.id).last

      if current_member.regular_member == true
        @order　= Order.find(current_member.id)
        @order.items << @egg
        @orderitem1 = Orderitem.find_by(order_id: @order.id, item_id: @egg.id)
        @orderitem1.orderitem_quantity = @regular_egg.regular_quantity
        @orderitem1.save
        @order.items << @milk
        @orderitem2 = Orderitem.find_by(order_id: @order.id, item_id: @milk.id)
        @orderitem2.orderitem_quantity = @regular_milk.regular_quantity
        @orderitem2.save
      end
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
