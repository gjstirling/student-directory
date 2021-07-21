def input_students 
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do 
    # add the student hash to the array
    puts "Which cohort are they joining ?"
    cohort = gets .delete_suffix!("\n")
    puts cohort
    cohort = "None specified" if cohort == ""
    puts "Add their favourite hobby"
    hobby = gets.chomp
    puts "enter their height"
    height = gets.chomp
    students << {name: name, cohort: cohort, hobby: hobby, height: height}
    puts "Now we have #{students.count} student" if students.count == 1
    puts "Now we have #{students.count} students" if students.count > 1
    # get another name from the user
    name = gets.chomp
  end 
students 
end

def print_header 
  puts "The students of Villains Academy".center(80)
  puts "-------------".center(80)
end

def print(students)
  return if students.length == 0 
  puts "Which cohort would you like to print?"
  cohort = gets.chomp
  print_header
  students.each_with_index do |student, index|
    if student[:cohort] == cohort
    puts "#{student[:name].center(20)} Height:#{student[:height].center(20)} Hobby:#{student[:hobby].center(20)}"
    end
  end
end

def print_footer(names)
  puts "No students entered"; return if names.length == 0 
  puts "Overall, we have #{names.count} great students".center(80)
end 

students = input_students
print(students)
print_footer(students)