class ItemsController < ApplicationController
    before_action :current_member

    def index
        @items = Item.order("id")
        @categories = Category.order("id")
    end

    def show
        @item = Item.find(params[:id])
        @order = Order.new()
    end

    def search
        @items = Item.search(params[:q])
        if current_member
            render "index"
        else 
            render "top/index"
        end
    end
    
    def new
        @item = Item.new
    end

    def edit
        @item = Item.find(params[:id])
    end

    def create
        @item = Item.new(params[:item])
        if @item.save
          # 保存が成功したらshowにリダイレクトする。フラッシュ値を設定する。
          redirect_to @item, notice: "商品を登録しました。"
        else
          # エラー発生時はnewに戻る
          render "new"
        end
    end

    def update
        @item = Item.find(params[:id])
        @item.assign_attributes(params[:item])
        if @item.save!
          # 保存が成功したらshowにリダイレクトする。フラッシュ値を設定する。
          redirect_to @item, notice: "商品を更新しました。"
        else
          # エラー発生時はeditに戻る
          render "edit"
        end
    end

    def add_item
        @orderitem = Orderitem.new(params[:item_id])
        if  @orderitem.save
            redirect_to :orders, notice: '商品が追加されました。'
        else
            redirect_to :orders, notice: '商品の追加に失敗しました。'
        end
    end
    def destroy
        @item = Item.find(params[:id])
        @item.destroy
        redirect_to :items, notice: "商品を削除しました。"
    end
end
