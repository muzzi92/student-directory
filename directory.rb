@students = []

# Method for inputting student information
def input_students
  puts "Please enter student names to add them."
  puts "Press enter twice to exit to the main menu."
  name = gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: "April"}
    puts "Students added so far: #{@students.count}"
    name = gets.chomp
  end
end

# Method to print header text
def print_header
  puts "The students of Villains Academy".center(50)
  puts "--------------".center(50)
end

# Method to print student information
def print_students_list
  i = 0
  while i < @students.length do
    puts "#{i + 1}. #{@students[i][:name]}: (#{@students[i][:cohort]} cohort)".center(50)
    i +=1
  end
end

# Method to print footer text inc. student count
def print_footer
    @students.count > 1 ? plural = "s" : plural = ""
    puts "In total, we have #{@students.count} great student#{plural}.".center(50)
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(input)
  case input
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit 
    else
      puts "I didn't understand the input, try again."
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

# Call methods
interactive_menu
