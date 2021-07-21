def interactive_menu
  students = []
  loop do 
    # 1. print the menu and ask the user what to complete
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
     # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection 
    when "1"
      students = input_students
    when "2"
      print(students)
      print_footer(students)
      # show the students
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end 
  end
end



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

interactive_menu