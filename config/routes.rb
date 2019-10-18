Rails.application.routes.draw do
  get 'sessions/new'
  resources :users, only: [:new, :create, :show]  #newアクションに登録フォームを表示させる。
  #view/newのform_withを使用する場合createアクションのルーティングが必要になる
end
