class WelcomeController < ApplicationController
  def index
    @thowers   = User.where(:throw_status =>     'doing')
    @vacuumers = User.where(:vacuum_up_status => 'doing')
    @wipingers = User.where(:wiping_status =>    'doing')
  end
end
