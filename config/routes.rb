Rails.application.routes.draw do
  resources :users, only: [:new,:create]  #newアクションに登録フォームを表示させる。
  #view/newのform_withを使用する場合createアクションのルーティングが必要になる
end
