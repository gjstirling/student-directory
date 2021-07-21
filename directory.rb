def interactive_menu
  @students = []
  try_load_students
  loop do 
    print_menu
     # 2. read the input and save it into a variable
    process(STDIN.gets.chomp)
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
  when "3" 
   save_students
  when "4"
   load_students
  when "9"
   exit # this will cause the program to terminate
  else
   puts "I don't know what you meant, try again"
  end
end

 def try_load_students
  filename = ARGV.first 
    if filename.nil?
      puts "Default file loaded"
      load_students()
    elsif File.exists?(filename)
     load_students(filename)
     puts "loaded #{@students.count} from #{filename}"
    else
     puts "Sorry #{filename} doesn't exist."
     exit
    end 
 end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    data(name, cohort)
  end
  file.close
end

def input_students 
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do 
    # add the student hash to the array
    puts "Which cohort are they joining ?"
    cohort = STDIN.gets.delete_suffix!("\n")
    data(name, cohort)
    puts "Now we have #{@students.count} student" if @students.count == 1
    puts "Now we have #{@students.count} students" if @students.count > 1
    # get another name from the user
    name = STDIN.gets.chomp
  end 
@students 
end

def data(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def save_students 
   # open the file for writing
   file = File.open("students.csv", "w")
   # iterate over the array of students
   @students.each do |student|
    # these two lines convert the hash data into a string to write to the file
     student_data = [student[:name], student[:cohort]]
     csv_line = student_data.join(",")
     file.puts csv_line
   end
   file.close
 end

def print_menu
  # 1. print the menu and ask the user what to complete
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students.csv"
  puts "4. Load the list of students.csv"
  puts "9. Exit"
end

def show_students
  print
  print_footer()
end 

def print_header 
  puts "The students of Villains Academy".center(80)
  puts "-------------".center(80)
end

def print
  return if @students.length == 0 
  puts "Which cohort would you like to print?"
  cohort = STDIN.gets.chomp
  print_header
  @students.each_with_index do |student, index|
    if student[:cohort] == cohort.to_sym
    puts "#{student[:name].center(20)}"
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