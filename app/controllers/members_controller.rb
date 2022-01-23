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
        if @member.save
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
        if @member.save
          # 保存が成功したらshowにリダイレクトする。フラッシュ値を設定する。
          redirect_to @member, notice: "会員を更新しました。"
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
