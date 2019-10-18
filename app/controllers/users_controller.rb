class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
    #  redirect #保存が成功した場合の処理
    else
      render 'new'
    end  
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)#userキーのそれぞれのカラム
  end

end
