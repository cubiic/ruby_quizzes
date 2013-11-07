# Devise a function that takes an input 'num' (integer) and returns a string that is the
# decimal representation of that number grouped by commas after every 3 digits. You can't
# solve the task using a built-in formatting function that can accomplish the whole
# task on its own.
# 
# Assume: 0 <= n < 1000000000
# 
# 1 -> "1"
# 10 -> "10"
# 100 -> "100"
# 1000 -> "1,000"
# 10000 -> "10,000"
# 100000 -> "100,000"
# 1000000 -> "1,000,000"
# 35235235 -> "35,235,235"


# Note: this works for floats as well:
def pretty_number(num)
  num.to_s.tap do |s|
    true while s.gsub!(/^([^.]*)(\d)(?=(\d{3})+)/, "\\1\\2,")
  end
end

puts "Tests:"
puts
puts "1            #=> #{pretty_number 1}"
puts "1000         #=> #{pretty_number 1000}"
puts "10000.12456  #=> #{pretty_number 10000.12456}"
puts "35235235     #=> #{pretty_number 35235235}"

# November 2013
