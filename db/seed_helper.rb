TABLES = [Comment, Post, User]

def destroy_old_records
  TABLES.each do |table|
    table.destroy_all
  end
end

def display_records_amount
  puts "## Created records:"
  TABLES.each do |table|
    puts "#{table.count} #{table.to_s}"
  end
end