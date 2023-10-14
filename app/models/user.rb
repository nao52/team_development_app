class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy

  def own?(object)
    id == object&.user_id
  end
end