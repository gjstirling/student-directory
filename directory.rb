def input_students 
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do 
    # add the student hash to the array
    puts "Add their favourite hobby"
    hobby = gets.chomp
    puts "enter their height"
    height = gets.chomp
    students << {name: name, cohort: :november, hobby: hobby, height: height}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end 
students 
end

def print_header 
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{student[:name].center(10)} Height:#{student[:height].center(10)} Hobby:#{student[:hobby].center(10)} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end 

students = input_students
print_header
print(students)
print_footer(students)