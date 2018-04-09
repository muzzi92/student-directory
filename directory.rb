# Method for inputting student information
def input_students
  students = []
  puts "Please enter student names to add them."
  puts "Press enter twice to exit to the main menu."
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: "April"}
    puts "Students added so far: #{students.count}"
    name = gets.chomp
  end
  students
end

# Method to print header text
def print_header
  puts "The students of Villains Academy".center(50)
  puts "--------------".center(50)
end
# Method to print student information
def print(students)
  i = 0
  while i < students.length do
    puts "#{i + 1}. #{students[i][:name]}: (#{students[i][:cohort]} cohort)".center(50)
    i +=1
  end
end
# Method to print footer text inc. student count
def print_footer(students)
    students.count > 1 ? plural = "s" : plural = ""
    puts "In total, we have #{students.count} great student#{plural}.".center(50)
end

def interactive_menu
  students = []
  loop do
    # 1. Print the menu options and ask user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. Obtain input and save it to a variable
    input = gets.chomp
    # 3. Do what the user has asked
    case input
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      break
    else
      puts "I didn't understand the input, try again."
    end
  end
end

# Call methods
interactive_menu
