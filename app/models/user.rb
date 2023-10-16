class User < ApplicationRecord

  authenticates_with_sorcery!

  validates :password, length: { minimum: 5 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :first_name, presence: true, length: { maximum: 200 }
  validates :last_name, presence: true, length: { maximum: 200 }
  validates :email, presence: true, length: { maximum: 200 }, uniqueness: true

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy

  def own?(object)
    id == object&.user_id
  end
end
