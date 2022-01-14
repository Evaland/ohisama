class Admin::MembersController < Admin::Base
    before_action :admin_login_required

    def index
        @members = Member.order("id")
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
          # 保存が成功したらshowにリダイレクトする。フラッシュ値を設定する。
          redirect_to @member, notice: "会員を登録しました。"
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
          redirect_to @member, notice: "マイページを更新しました。"
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
