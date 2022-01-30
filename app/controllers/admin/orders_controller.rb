class Admin::OrdersController < Admin::Base
    before_action :current_cart
    before_action :admin_login_required
    
    def index
        @orders =Order.order("id")
    end
    
    def show
        @orders = Order.order("id")
        @order = Order.find_by(member_id: params[:id])
        @orderitem = Orderitem.where(order_id: @order.id)
    end

    def edit
        p "#{params}"
        @order = Order.find_by(id: params[:id])
        @member = Member.find_by(id: @order.member_id)
    end
    

    def update
        flag = true 
        @member = Order.where(order_group: params[:order][:group])
        p @member.count
        @member.each do |member|
            p member.id
            @order =Order.find_by("member_id = ?",member.member_id)
            p "ここ#{@order.id}"
            @order.assign_attributes(status: params[:order][:status])
            unless @order.save 
                flag = false 
            end
        end
        
        if flag
          redirect_to :admin_orders, notice: "マイページを更新しました。"
        else
          render "edit"
        end
    end

end