desc 'release cleaners, and assign new cleaners'
task rehash_cleaners: :environment do
  # weekly
  if Time.now.sunday?
    User.rehash_cleaners
  end
end
