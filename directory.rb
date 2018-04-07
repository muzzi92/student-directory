# User input method to create student list
def input_students
  students = []
  while true do
    puts "Please enter a student name: "
    name = gets.chomp
    puts "Please enter cohort month for this student: "
    cohort = gets.chomp
    puts "Please enter a hobbie for this student: "
    hobbie = gets.chomp
    students << {name: name, cohort: cohort, hobbies: hobbie}
    puts "Add another student, yes or no?"
    input = gets.chomp
    break if input == "no"
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
  i = 0
  while i < students.length do
    if students[i][:name].chr.downcase == "m" && students[i][:name].length < 12
      puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort) likes #{students[i][:hobbies]}."
    end
    i +=1
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
