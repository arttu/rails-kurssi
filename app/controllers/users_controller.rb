class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      NewsfeedEvent.create(:text => "A new user was registered: #{@user.login}")
      flash[:notice] = "Account registered!"
      redirect_back_or_default account_path
    else
      render :action => :new
    end
  end

  def show
    @user = User.find_by_login(params[:login]) || current_user
  end

  def become_a_friend
    @user = User.find_by_login(params[:login])
    current_user.become_a_friend_with(@user)
    redirect_back_or_default "/account/#{@user.login}"
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end

  def destroy
    current_user.destroy
    flash[:notice] = "Account destroyed!"
    redirect_to root_url
  end
end