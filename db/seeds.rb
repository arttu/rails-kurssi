# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

# helper method to collect models from conventional rails application
def collect_models
  @collected_models ||= Dir.glob(File.join('app','models','*.rb')).map{|model| model.split(/([^\/\\]+)\.(\w+)$/).second.pluralize.camelize} # lol :)
end


# basic input validation

record_counts = ARGV[1..-1]
truncate = record_counts.delete("TRUNCATE=1")

if record_counts.empty?
  puts "
This is a script to generate some amount of test data for your application.
Currently it supports only text fields. Others maybe later.

Usage:

  You must give me at least one existing resource to generate with a number in range of 0..1000.
  
  Optionally you can specify if the table(s) is/are going to be truncated
  or not by adding a word 'TRUNCATE' to the command parameters.
  
  By default the script is appending the data into tables.
  
  Examples of command:
   'rake db:seed Courses=100'
   'rake db:seed Courses=500 TRUNCATE'
  
  Currently available resources you can use: #{collect_models.join(', ')}
  "
  exit(1)
end


# the main script

require 'random_data'

record_counts.each do |record_and_count|
  record, count = record_and_count.split('=')
  
  unless collect_models.include?(record) || (0..1001).include?(count.to_i)
    puts "Not a valid resource ''#{record}' or number '#{count}' not in range of 0..1000."
    next
  end
  
  record = record.singularize.constantize
  count = Integer(count)
  
  puts "Current count for '#{record}': #{record.count}"
  
  record.delete_all if truncate
  
  cols = record.columns
  cols.delete_if { |col| [:id, :created_at, :updated_at].include?(col.name.to_sym) }
  
  count.times do |i|
    new_record = record.new
    cols.each do |col|
      value = case col.type
              when :string
                Random.alphanumeric
              when :text
                Random.paragraphs(Random.number(3))
              when :date, :datetime
                Random.date
              end
      new_record.send("#{col.name}=".to_sym, value)
    end
    new_record.save
  end

  puts "And the new one: #{record.count}"

end
