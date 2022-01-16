class OrderitemsController < ApplicationController
    def show
        @orderitems = Orderitem.where(cart_id:current_cart.id)
        @total_price = 0
        if @orderitems
          @orderitems.each do |orderitem|
            @total_price += orderitem.item.price * orderitem.quantity
          end
        end
    end
     
    def create
        cart = current_cart
        item = Item.find(params[:item_id])
        cart_item = .add_item(item.id)
        
        if(cart_item.amount)
        cart_item.amount += params[:amount].to_i
        cart_item.save
        redirect_to cart_items_path, notice: '個数を追加しました！'
        else
        cart_item.amount = params[:amount].to_i
        cart_item.save
        redirect_to cart_items_path, notice: '商品を新規追加しました！'
        end
        
    end
    
    def destroy
        @cart_item.destroy
        redirect_to current_cart
        
    end
    
    def delete_item
        @orderitem.destroy
        redirect_to current_cart
    end
    
    private
    
    def setup_cart_item
        @orderitem = Orderitem.find_by(orderitem_id: current_cart.id,item_id: params[:item_id])
    end
    end
end
