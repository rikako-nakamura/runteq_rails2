namespace :article_summary do
  desc '管理者に対して公開済みの総記事数、昨日公開された記事の件数とタイトルを送信'
  task mail_article_summary: :enviroment do
    ArticleMailer.report_summary.deliver_now
  end
end
