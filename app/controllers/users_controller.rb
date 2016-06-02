class UsersController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :destroy, :followings, :followers]
  before_action :collect_user, only: [:edit, :update]

  def show # 追加
    @microposts = @user.microposts.order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # ここを修正
    else
     render 'new'
    end
  end

  def edit
    render 'edit'
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Updated your Plofile"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    @user.destroy
    redirect_to root_path, notice:'削除しました' 
  end
  
  def followings
    @title = 'followings'
    @users = @user.following_users
    render 'follow_list'
  end
  def followers
    @title = 'followers'
    @users = @user.follower_users
    render 'follow_list'
  end
  
  
  #ここから　Private--------------------------
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :location,:website)
  end
 
  def collect_user
    redirect_to root_path if @user != current_user
  end

  def set_params
    @user = User.find(params[:id])
  end
  
end
