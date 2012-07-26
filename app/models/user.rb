class User < ActiveRecord::Base
  attr_accessible :name, :throw_date, :vacuum_up_date, :wiping_date, :seated, :throw_done, :vacuum_up_done, :wiping_done

  scope :target, proc { |duty_name|
    where(:seated => true).where(duty_name => false)
  }

end
