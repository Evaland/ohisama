class OrderitemsController < ApplicationController

    def show
        @orderitems = Item.where(item_id:params[id])
        orderitem.orderitem_quantity = @orderitem.item_quantity
        orderitem.order_price = @orderitem.price
        @total_price = 0
        if @orderitems.present?
          @orderitems.each do |orderitem|
            @total_price += orderitem.order_price * orderitem.orderitem_quantity
          end
        end
  end
     

  def new
    @orderitem = Orderitem.new
    @item = Item.find_by(id: session[:member_id])
  end

  # アイテムの追加
  def create
    @orderitem = Orderitem.new(params[:id])
    @item = Item.find_by(id: session[:member_id])
    @orderitem.orderitem_price = @item.price
    @orderitem.orderitem_name = @item.item_name
    if  @orderitem.save
      redirect_to orders, notice: '商品が追加されました。'
    else
      redirect_to orders, notice:'商品の追加に失敗しました。'
    end
  end

  # アイテムの更新
  def update
    if @cart_item.update(orderitem_quantity: params[:orderitem_quantity].to_i)
      redirect_to orders, notice: 'カート内の商品が更新されました'
    else
      redirect_to orders, notice: 'カート内の商品の更新に失敗しました'
    end
  end


  private def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
  end
end
