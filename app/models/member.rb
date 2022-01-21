class Member < ApplicationRecord
    has_secure_password

    has_many :regulars, dependent: :destroy
    has_many :orders, dependent: :destroy

    validates :name, presence: true
    validates :adress, presence: true

    validates :user_id, presence: true,
    format: {
        # アルファベットから始まり、英数字のみ
        with: /\A[A-Za-z][A-Za-z0-9]*\z/,
        # presenceとの重複を避けるため
        allow_blank: true,
        message: :invalid_member_name
    },
    # 2文字以上20文字以下
    length: { minimum: 1, maximum: 20, allow_blank: true },
    # 重複禁止
    uniqueness: { case_sensitive: false }

    validates :password, presence: true,
    format: {
        # アルファベットから始まり、英数字のみ
        with: /\A[A-Za-z][A-Za-z0-9]*\z/,
        # presenceとの重複を避けるため
        allow_blank: true,
        message: :invalid_member_name
    },
    # 2文字以上20文字以下
    length: { minimum: 6, maximum: 20, allow_blank: true }
    
    validates :password_confirmation, presence: true,
    format: {
        # アルファベットから始まり、英数字のみ
        with: /\A[A-Za-z][A-Za-z0-9]*\z/,
        # presenceとの重複を避けるため
        allow_blank: true,
        message: :invalid_member_name
    },
    # 2文字以上20文字以下
    length: { minimum: 6, maximum: 20, allow_blank: true }

end
