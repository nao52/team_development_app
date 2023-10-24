require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "バリデーションチェック" do
    it "設定したバリデーションが機能しているか" do
      article = build(:article)
      expect(article).to be_valid
      expect(article.errors).to be_empty
    end

    it "titleがない場合にvalidationが機能してinvalidになるか" do
      article_without_title = build(:article, title: "")
      expect(article_without_title).to be_invalid
      expect(article_without_title.errors.full_messages).to include "タイトルを入力してください"
    end

    it "bodyがない場合にvalidationが機能してinvalidになるか" do
      article_without_body = build(:article, body: "")
      expect(article_without_body).to be_invalid
      expect(article_without_body.errors.full_messages).to include "内容を入力してください"
    end

    it "user_idがnilの場合にvalidationが機能してinvalidになるか" do
      article_without_user_id = build(:article, user_id: nil)
      expect(article_without_user_id).to be_invalid
      expect(article_without_user_id.errors.full_messages).to_not be_empty
    end
  end
end
