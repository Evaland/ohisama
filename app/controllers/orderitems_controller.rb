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
     
    def create
        cart = current_cart
        item = Item.find(params[:item_id])
        cart_item = cart.add_item(item.id)
        
        if(cart_item.order_quantity)
            cart_item.order_quantity += params[:order_quantity].to_i
            cart_item.save
            redirect_to orderitems_path, notice: '個数を追加しました！'
        else
            cart_item.order_quantity = params[:order_quantity].to_i
            cart_item.save
            redirect_to orderitems_path, notice: '商品を新規追加しました！'
        end
        
    end
    
    def add_item
        if Orderitem.find_by(item_id: params[:item_id], orderitem_id: current_cart.id).blank?
          @cart_item = current_cart.orderitems.create(item_id: params[:item_id])
        end
        
        @cart_item.quantity += params[:item][:quantity].to_i
        @cart_item.save!
        redirect_to current_cart
      end

    def destroy
        @orderitem.destroy
        redirect_to orderitems_path
        
    end
    
    def delete_item
        @orderitem.destroy
        redirect_to orderitems_path
    end
    
    private
    
    def setup_cart_item
        @orderitem = Orderitem.find_by(orderitem_id: current_cart.id,item_id: params[:item_id])
    end
end
