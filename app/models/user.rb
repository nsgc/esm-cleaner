# -*- coding: utf-8 -*-
class User < ActiveRecord::Base
  attr_accessible :name, :throw_date, :vacuum_up_date, :wiping_date, :seated, :throw_status, :vacuum_up_status, :wiping_status

  scope :recent_no_worker, proc {
    last_week = 1.week.ago.at_beginning_of_week
    where('vacuum_up_date < ? AND wiping_date < ? AND throw_date < ?', last_week, last_week, last_week)
  }

  scope :thrower_target, proc {
    where(:seated => true).where(:throw_status => 'todo').recent_no_worker.order('throw_date ASC')
  }
  scope :vacuumer_target, proc {
    where(:seated => true).where(:vacuum_up_status => 'todo').recent_no_worker.order('vacuum_up_date ASC')
  }
  scope :wipingner_target, proc {
    where(:seated => true).where(:wiping_status => 'todo').recent_no_worker.order('wiping_date ASC')
  }

  # 週1回だけ呼ぶよ
  def self.rehash_cleaners
    self.cleaners_done
    next_throwers =  User.thrower_target
    next_vacuumers = User.vacuumer_target
    next_wipingers = User.wipingner_target

    if (next_throwers.size < 2) && (next_vacuumers.size < 2) && (next_wipingers.size < 2)
      self.all_cleaners_todo
    end

    self.cleaners_doing
  end

  # 今週の掃除当番を選択
  def self.cleaners_doing
    self.thrower_target.limit(2).each do |user|
      user.throw_status = 'doing'
      user.throw_date = Date.today.at_beginning_of_week
      user.save
    end

    self.vacuumer_target.limit(2).each do |user|
      user.vacuum_up_status = 'doing'
      user.vacuum_up_date = Date.today.at_beginning_of_week
      user.save
    end

    self.wipingner_target.limit(2).each do |user|
      user.wiping_status = 'doing'
      user.wiping_date = Date.today.at_beginning_of_week
      user.save
    end
  end

  # 今週の掃除当番から開放
  def self.cleaners_done
    User.where(:throw_status => 'doing').each do |user|
      user.throw_status = 'done'
      user.save
    end

    User.where(:vacuum_up_status => 'doing').each do |user|
      user.vacuum_up_status = 'done'
      user.save
    end

    User.where(:wiping_status => 'doing').each do |user|
      user.wiping_status = 'done'
      user.save
    end
  end

  # 割り当てれる人がいなかった時
  def self.all_cleaners_todo
    User.all.each do |user|
      user.throw_status =     'todo'
      user.vacuum_up_status = 'todo'
      user.wiping_status =    'todo'
      user.save
    end
  end

end
