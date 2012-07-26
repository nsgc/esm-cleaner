# -*- coding: utf-8 -*-
require 'spec_helper'

describe User do
  before do
    load "#{Rails.root}/db/seeds.rb"
    @users = User.all
  end

  describe 'self.cleaners_done' do
    before do
      User.cleaners_done
    end

    it '各ステータスが対象人数ずついる' do
      User.where(:throw_status => 'done').should have(2).users
      User.where(:vacuum_up_status => 'done').should have(4).users
      User.where(:wiping_status => 'done').should have(2).users
    end
  end

  describe 'self.cleaners_done' do
    before do
      User.all_cleaners_todo
    end

    it '各ステータスで絞り込んでも全人数になる' do
      User.where(:throw_status => 'todo').should have(@users.size).users
      User.where(:vacuum_up_status => 'todo').should have(@users.size).users
      User.where(:wiping_status => 'todo').should have(@users.size).users
    end

  end
end
