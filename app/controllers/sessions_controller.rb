class SessionsController < ApplicationController
  def new
  end

  def create  #find_byはuserコントロラからemailを取得。下記参照。
    user = User.find_by(email: params[:session][:email].downcase)#find_byメソッドは条件を元にDBから該当するレコードを検索し、該当するものがあればそのレコードを返し、なければfalseを返す。
    #authenticateメソ(オーセンティケーション)は引数の文字列がパスワードと一致するUserオブジェクトを返す。そうじゃなければfalseを返す
    if user && user.authenticate(params[:session][:password])#modelでhas_secure_passwordメソを指定するとauthenticateメソが使用可能になる。

    else
      flash.now[:danger] = 'ログインに失敗しました' # フラッシュメッセージを追加
      render 'new'
    end
  end
end




# Started POST "/sessions" for ::1 at 2019-10-18 16:26:02 +0900
# Processing by SessionsController#create as HTML
#   Parameters: {"utf8"=>"✓", "authenticity_token"=>"Swgh9WnCZSW8qxtv6R5COxebBcIHUiOkPA2QOwd1fTBGisD3TM8NYZXZ3Y2/D4btDSG0spve3Eem7xbfAaXu4g==", "session"=>{"email"=>"", "password"=>"[FILTERED]"}, "commit"=>"Log in"}
#   User Load (0.6ms)  SELECT  "users".* FROM "users" WHERE "users"."email" = $1 LIMIT $2  [["email", ""], ["LIMIT", 1]]
#   ↳ app/controllers/sessions_controller.rb:6
# No template found for SessionsController#create, rendering head :no_content
# Completed 204 No Content in 41ms (ActiveRecord: 2.0ms)
