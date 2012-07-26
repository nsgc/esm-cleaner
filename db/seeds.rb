User.destroy_all

%w{nsgc haneda}.each do |name|
  User.create(:name => name, :throw_status => 'doing', :throw_date => Date.today.at_beginning_of_week)
end

%w{chimamen koic}.each do |name|
  User.create(:name => name, :vacuum_up_status => 'doing', :vacuum_up_date => Date.today.at_beginning_of_week)
end


%w{ursm kenchan}.each do |name|
  User.create(:name => name, :wiping_status => 'doing', :wiping_date => Date.today.at_beginning_of_week)
end

%w{akiino baba}.each do |name|
  User.create(:name => name, :vacuum_up_status => 'done', :vacuum_up_date => Date.today.at_beginning_of_week)
end

%w{aaa bbb ccc ddd eee fff ggg hhh iii jjj kkk}.each do |name|
  User.create(:name => name)
end
