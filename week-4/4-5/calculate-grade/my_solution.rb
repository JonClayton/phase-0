# Calculate a Grade

# I worked on this challenge with: Gregg Wehmeier.

# Jon's three approaches:
# 1. case/when
# 2. if then elsif elsif
# 3. formula to get 0,1,2, and then pull from grade array ['A','B','C']

# Various methods for solution
def various_get_grade (grade)
  method=4
  case method
  when 1
    if grade < 60
      return 'F'
      elsif grade < 70 
        return 'D'
        elsif grade < 80
        return 'C'
          elsif grade < 90
          return 'B'
          else
            return 'A'
    end
  when 2
    case
    when grade<60
      return 'F'
    when grade<70
      return 'D'
    when grade<80
      return 'C'
    when grade<90
      return 'B'
    else 
      return 'A'
    end
  when 3
    grades = ["A","B","C","D","F","A"]
    index = [(99-grade)/10,4].min
    return grades[index]
  when 4
    return ["A","B","C","D","F","A"][[(99-grade)/10,4].min]
  end
end

# A single expression solution
def get_grade(grade)
  ["A","B","C","D","F","A"][[(99-grade)/10,4].min]
end