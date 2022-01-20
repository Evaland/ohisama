class OrdersController < ApplicationController
    def index
        @orders = Order.order("id")
    end
    
    def show
      @orderitem << @item
      @orderitem = Orderitem.new(params[:orderitem])
      @order = Order.find(params[:id])
    end
    
    def new
        @order = Order.new
    end

    def create # Order に情報を保存します
        orderitems = current_member.orderitems.all
      # ログインユーザーのカートアイテムをすべて取り出して cart_items に入れます
        @order = current_member.orders.new(order_params)
      # 渡ってきた値を @order に入れます
        if @order.save
      # ここに至るまでの間にチェックは済ませていますが、念の為IF文で分岐させています
          orderitems.each do |orderitem|
      # 取り出したカートアイテムの数繰り返します
      # order_item にも一緒にデータを保存する必要があるのでここで保存します
            order_item = Orderitem.new
            order_item.item_id = order.item_id
            order_item.order_id = @order.id
            order_item.order_quantity = cart.quantity
      # 購入が完了したらカート情報は削除するのでこちらに保存します
            order_item.order_price = cart.item.price
      # カート情報を削除するので item との紐付けが切れる前に保存します
            order_item.save
          end
          redirect_to @item
          cart_items.destroy_all
      # ユーザーに関連するカートのデータ(購入したデータ)をすべて削除します(カートを空にする)
        else
          @order = Order.new(order_params)
          render :new
        end
      end
      
      
      def destroy_item
        @item = Orderitem.find(params[:id])
        if @item.destroy
          redirect_to orders, notice: 'カート内の商品が削除されました'
        else
          redirect_to orders, notice:  '削除に失敗しました'
        end
      end

      def destroy_cart
        @cart = Order.order("id")
        if @cart.destroy
          redirect_to orders, notice: 'カートが削除されました'
        else
          redirect_to orders, notice: '削除に失敗しました'
        end
      end
end
