class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :name,           :null =>    false
      t.datetime :throw_dete,     :default => Time.parse('19800811')
      t.datetime :wiping_date,    :default => Time.parse('19800811')
      t.datetime :vacuum_up_date, :default => Time.parse('19800811')
      t.boolean  :seated,         :default => true

      t.boolean  :throw_done,     :default => false
      t.boolean  :wiping_done,    :default => false
      t.boolean  :vacuum_up_done, :default => false

      t.timestamps
    end
  end
end
