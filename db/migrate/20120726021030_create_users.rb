class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :name,           :null =>    false
      t.datetime :throw_date,     :default => Time.parse('19800811')
      t.datetime :wiping_date,    :default => Time.parse('19800811')
      t.datetime :vacuum_up_date, :default => Time.parse('19800811')
      t.boolean  :seated,         :default => true

      t.string  :throw_status,     :default => 'todo'
      t.string  :wiping_status,    :default => 'todo'
      t.string  :vacuum_up_status, :default => 'todo'

      t.timestamps
    end
  end
end
