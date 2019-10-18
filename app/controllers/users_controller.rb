class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save  #userはshowアク
      redirect_to user_path(@user.id)# redirect_to #保存が成功した場合の処理   詳細ページにidを持たせる
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)#userキーのそれぞれのカラム
  end

end
