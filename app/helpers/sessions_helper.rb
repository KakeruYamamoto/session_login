module SessionsHelper
  def current_user  #自己代入演算子
    @current_user ||= User.find_by(id: session[:user_id]) #@current_userが真の場合はそのままで、偽の場合は右辺の値を代入する。
  # @current_user || @current_user = User.find_by(id: session[:user_id])  と同じ
  end

  def logged_in?
      current_user.present?#ユーザがログインしていればtrue,その他なら falseを返すメソッド
  end
end
