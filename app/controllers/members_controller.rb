class MembersController < ApplicationController


    def index
        @member=Member.find_by(id: session[:member_id])
    end

    def show
        @member = Member.find(params[:id])
    end

    def new
        @member = Member.new
    end

    def edit
        @member = Member.find(params[:id])
    end

    def create
        @member = Member.new(params[:member])
        @egg = Item.find_by(item_name: "卵")
        @milk = Item.find_by(item_name: "牛乳")
        if @member.save
          if @member.regular_member == true
            @regular_egg = Regular.new(member_id: @member.id, item_id: @egg.id)
            @regular_egg.regular_quantity = 1
            @regular_milk = Regular.new(member_id: @member.id, item_id: @milk.id)
            @regular_milk.regular_quantity = 1
            @regular_egg.save
            @regular_milk.save
          end
          session[:member_id] = @member.id
          redirect_to :root, notice: "会員を登録しました。"
        else
          # エラー発生時はnewに戻る
          render "new"
        end
    end

    def update
      @member = Member.find(params[:id])
      @member.assign_attributes(params[:member])
      @egg = Item.find_by(item_name: "卵")
      @milk = Item.find_by(item_name: "牛乳")
      if @member.save
        if @member.regular_member == true
            @regular_egg = Regular.new(member_id: @member.id, item_id: @egg.id)
            @regular_egg.regular_quantity = 1
            @regular_milk = Regular.new(member_id: @member.id, item_id: @milk.id)
            @regular_milk.regular_quantity = 1
            @regular_egg.save
            @regular_milk.save
            
            
        else
          if Regular.find_by(member_id: @member.id).present?
            @regular = Regular.where(member_id: @member.id)
            @regular.destroy_all
          end
        end
        redirect_to :members, notice: "マイページを更新しました。"
      else
        # エラー発生時はeditに戻る
        render "edit"
      end
  end

    

    def destroy
        @member = Member.find(params[:id])
        @member.destroy
        redirect_to :members, notice: "会員を削除しました。"
    end

end
