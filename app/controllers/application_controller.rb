class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper  #スペルミスにはきよつける  uninitialized constant ApplicationController::SesionsHelper(routing error)
end


#
# 実はSessionsコントローラを生成した時点ですでにセッション用のヘルパーモジュールが自動生成されています。
# （ヘルパーモジュールとは、そのモジュール内にメソッドを記述しておくことで、そのモジュールを含んだクラスでそのメソッドが使えるようになる機能のことです）
#
# Applicationコントローラにこのモジュールをインクルードする（含める）ことによって、Railsの全コントローラでこのモジュールが使用できるようになるので、設定しておきます。
