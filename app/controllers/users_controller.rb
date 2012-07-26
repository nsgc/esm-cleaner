# -*- coding: utf-8 -*-
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to root_path, notice: '新規登録したった'
    else
      render 'users/new'
    end
  end
end
