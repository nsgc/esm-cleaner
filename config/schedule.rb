every :weekend, :at => '11pm' do
  runner "User.rehash_cleaners"
end
