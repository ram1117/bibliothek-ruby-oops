module Validator
  # method checks if provided input is empty. returns a value only when the input is not empty
  def validate_input_empty(field)
    var1 = gets.chomp
    while var1.empty?
      print "Please enter a valid value for - #{field}\n"
      var1 = gets.chomp
    end
    var1
  end

  # method checks if provided input is an integer. returns a value only when the input is an integer
  def validate_input_int(field)
    var1 = gets.chomp
    while var1.empty? || var1.count('a-zA-Z').positive?
      print "Please enter a valid value (Number) for - #{field}\n"
      var1 = gets.chomp
    end
    var1.to_i
  end

  # method checks if provided input is within the provided range. returns a value only when the input is in range
  def validate_input_range(field, min, max)
    var1 = validate_input_int(field)
    until (min..max).include?(var1.to_i)
      print "Please enter a valid value for - #{field} between #{min} and #{max}\n"
      var1 = validate_input_int(field)
    end
    var1.to_i
  end

  # method checks if provided input is empty and y/Y/N/n. returns a value only when the input is not empty
  def validate_input_boolean(field)
    var1 = gets.chomp
    while var1.empty? || !%w[Y y N n].include?(var1)
      print "Please enter a valid value for - #{field}\n"
      var1 = gets.chomp
    end
    var1
  end

  # method checks if provided input is a valid date format. returns a value only when the input is valid date format
  def validate_input_date(field)
    var1 = validate_input_empty(field)
    until var1.match(/\d{4}-\d{2}-\d{2}/)
      print "Please enter a valid value for - #{field}\n"
      var1 = validate_input_date(field)
    end
    var1
  end
end
