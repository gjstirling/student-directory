def interactive_menu
  @students = []
  loop do 
    print_menu
     # 2. read the input and save it into a variable
    process(gets.chomp)
    # 3. do what the user has asked
  end
end

def process(selection)
   case selection 
   when "1"
     input_students
   when "2"
     show_students
     # show the students
   when "9"
     exit # this will cause the program to terminate
   else
     puts "I don't know what you meant, try again"
   end
end

def print_menu
  # 1. print the menu and ask the user what to complete
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print()
  print_footer()
end 



def input_students 
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
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
    @students << {name: name, cohort: cohort, hobby: hobby, height: height}
    puts "Now we have #{@students.count} student" if @students.count == 1
    puts "Now we have #{@students.count} students" if @students.count > 1
    # get another name from the user
    name = gets.chomp
  end 
@students 
end

def print_header 
  puts "The students of Villains Academy".center(80)
  puts "-------------".center(80)
end

def print
  return if @students.length == 0 
  puts "Which cohort would you like to print?"
  cohort = gets.chomp
  print_header
  @students.each_with_index do |student, index|
    if student[:cohort] == cohort
    puts "#{student[:name].center(20)} Height:#{student[:height].center(20)} Hobby:#{student[:hobby].center(20)}"
    end
  end
end

def print_footer
  if @students.length == 0  
    puts "No students entered" 
  else
    puts "Overall, we have #{@students.count} great students".center(80)
  end
end 

interactive_menu