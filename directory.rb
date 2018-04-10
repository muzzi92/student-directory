@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save inputted students"
  puts "4. Load previously inputted students"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(input)
  case input
    when "1"
      selection_feedback(input)
      input_students
    when "2"
      selection_feedback(input)
      show_students
    when "3"
      selection_feedback(input)
      save_students
    when "4"
      selection_feedback(input)
      load_students
    when "9"
      selection_feedback(input)
      exit
    else puts "I didn't understand the input, try again."
  end
end

def selection_feedback(input)
  puts "You have successfully selected option #{input}"
end

def input_students
  puts "Please enter student names to add them."
  puts "Press enter twice to exit to the main menu."
  name, cohort = STDIN.gets.chomp, "April"
  while !name.empty? do
    build_students_array(name, cohort)
    puts "Students added so far: #{@students.count}"
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "--------------".center(50)
end

def print_students_list
  i = 0
  while i < @students.length do
    puts "#{i + 1}. #{@students[i][:name]}: (#{@students[i][:cohort]} cohort)".center(50)
    i +=1
  end
end

def print_footer
    @students.count > 1 ? plural = "s" : plural = ""
    puts "In total, we have #{@students.count} great student#{plural}.".center(50)
end

def save_students
  puts "Which file would you like to save to?"
  File.open(STDIN.gets.chomp, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
end

def load_students(filename = "students.csv")
  puts "Which file would you like to load from?"
  File.open(STDIN.gets.chomp, "r") do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(",")
      build_students_array(name, cohort)
    end
  end
end

def try_load_students(filename = "students.csv")
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def build_students_array(name, cohort)
  @students << {name: name, cohort: cohort}
end

interactive_menu
