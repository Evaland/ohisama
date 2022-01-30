class Admin::StatusesController < Admin::Base
    def index
        @orders =Order.order("id")
    end

    def edit
        @order = Order.find_by(id: params[:id])
    end

    def update
        @order = Order.find(params[:id])
        @order.assign_attributes(params[:order])
        if @order.save
          redirect_to :admin_statuses, notice: "会員を更新しました。"
        else
          render "edit"
        end
    end

end