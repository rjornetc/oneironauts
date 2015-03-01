['registered', 'banned', 'moderator', 'admin'].each do |role|
  Role.find_or_create_by({name: role})
end
  
['News & announcements', 'Dream Science', 'Other'].each do |cat|
  Category.find_or_create_by({name: cat})
end