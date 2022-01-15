class ItemsController < ApplicationController
    
    def index
        @items = Item.order("id")
        @categories = Category.order("id")
    end

    def show
        @item = Item.find(params[:id])
        @category = Category.find(params[:id])
    end

    def search
        @items = Item.search(params[:q])
        render "index"
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

    def destroy
        @item = Item.find(params[:id])
        @item.destroy
        redirect_to :items, notice: "商品を削除しました。"
    end
end
