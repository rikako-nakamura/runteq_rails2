require 'rake_helper'

describe 'article_state:change_to_be_published' do
  subject(:task) { Rake.application['article_state:change_to_be_published'] }
  before do
    create(:article, state: :publish_wait, published_at: Time.current - 1.day)
    create(:article, state: :publish_wait, published_at: Time.current + 1.day)
    create(:article, state: :draft)
  end
  # メソッド名やスコープ名の制約があるため自動コードレビューでは実施していません。
  # 参考までに解答例を書いておきます。
  it 'update_article_state' do
    expect { task.invoke }.to change { Article.published.size }.from(0).to(1)
  end
end
