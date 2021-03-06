def interactive_menu
  @students = []
  loop do 
    print_menu
     # 2. read the input and save it into a variable
    process(STDIN.gets.chomp)
    # 3. do what the user has asked
  end
end

def load_students()
  puts "Enter which file you'd like to load"
  @filename = gets.chomp
  File.open(@filename, "r"){|file| file.readlines.each{|line| (name, cohort) = line.chomp.split(','); data(name, cohort)}}
end

def save_students 
   # open the file for writing
  puts "Save students to which file ?"
  @filename = gets.chomp
  File.open(@filename, "w"){|file| @students.each {|student| file.puts [student[:name], student[:cohort]].join(",")}}
end
  # file = File.open(@filename, "w")
  #  # iterate over the array of students
  # @students.each do |student|
  #   # these two lines convert the hash data into a string to write to the file
  #   student_data = [student[:name], student[:cohort]]
  #   csv_line = student_data.join(",")
  #   file.puts csv_line
  # end
  # file.close
#end
 
 def process(selection)
  case selection 
  when "1"
    puts "Entered add new students mode" 
    input_students
  when "2"
    puts "Showing listed students"  
    show_students
    # show the students
  when "3" 
    puts "Saving new students"  
    save_students
  when "4"
    puts "Loading students from file"
    load_students 
  when "9"
    puts "Program terminated"
    exit # this will cause the program to terminate
  else
   puts "I don't know what you meant, try again"
  end
end

def print_menu
  # 1. print the menu and ask the user what to complete
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students to a file"
  puts "4. Load the list of students from a file"
  puts "9. Exit"
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
    puts "Now we have #{@students.count} student#{"s" if @students.size !=1}"   
    # get another name from the user
    name = STDIN.gets.chomp
  end 
@students 
end

def data(name, cohort)
  @students << {name: name, cohort: cohort}
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
  print_header
  @students.each_with_index do |student, index|
    puts "#{student[:name].center(20)} #{student[:cohort].center(20)}"
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