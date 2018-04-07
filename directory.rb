# Method for inputting student information
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
# Method to sort students into hash by cohorts
def sort_by_cohort(students)
  sorted_by_cohort = {}
  students.each do |student|
    cohort = student[:cohort]
    if sorted_by_cohort[cohort] == nil
      sorted_by_cohort[cohort] = []
    end
    sorted_by_cohort[cohort].push(student[:name])
  end
  sorted_by_cohort
end
# Method for printing users by desired cohort
def print_cohort_hash(hash)
  puts "What cohort of students would you like to view? "
  cohort = gets.chomp
  puts cohort + ":"
  puts hash[cohort]
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
    if students[i][:name].to_s.chr.downcase == "m" && students[i][:name].length < 12
      puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort) likes #{students[i][:hobbies]}.".center(50)
    end
    i +=1
  end
end
# Method to print footer text inc. student count
def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(50)
end
# Call methods
students = input_students
print_header
print_cohort_hash(sort_by_cohort(students))
print_footer(students)
