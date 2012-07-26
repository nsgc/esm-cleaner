# -*- coding: utf-8 -*-
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to root_path, notice: '新規登録したった'
    else
      render 'users/new'
    end
  end

  def seated_change
    @user = User.find(params[:user_id])
    @user.seated = !@user.seated
    @user.save
    redirect_to :users
  end
end
