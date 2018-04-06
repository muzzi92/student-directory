# User input method to creat student list
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # Create an empty array
  students = []
  # Get first name
  name = gets.chomp
  # While name is not empty, repeat this code
  while !name.empty? do
    # Add the student hash to the array
    students.push << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # Get nother name from user
    name = gets.chomp
  end
  students
end
# Method to print header text
def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end
# Method to print list of students
def print(students)
  students.each do |student|
    if student[:name].chr.downcase == "m"
      puts "#{students.index(student) + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end
# Method to print footer text inc. student count
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
# Call methods
students = input_students
print_header
print(students)
print_footer(students)
