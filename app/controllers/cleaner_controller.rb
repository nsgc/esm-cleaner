class CleanerController < ApplicationController
  def index
    @thowers   = User.where(:throw_status =>     'doing')
    @vacuumers = User.where(:vacuum_up_status => 'doing')
    @wipingers = User.where(:wiping_status =>    'doing')
    @users = User.all
  end

  def assign
    User.rehash_cleaners
    redirect_to root_path
  end

  def init
    load "#{Rails.root}/db/seeds.rb"
    redirect_to root_path
  end
end
