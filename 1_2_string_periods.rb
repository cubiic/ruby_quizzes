# A non-empty zero-indexed string S consisting of Q characters is given. The period of this string is
# the smallest positive integer P such that:
#
# P ≤ Q / 2 and
# S[K] = S[K+P] for 0 ≤ K < Q − P.
#
# For example, 9 is the period of "hamburguerhamburguerham".
# For example, 8 is the period of "codilitycodilityco".
#
# A positive integer M is the binary period of a positive integer N if M is the period of the binary
# representation of N.
# For example, 4 is the binary period of 955, because the binary representation of 955 is "1110111011"
# and its period is 4. On the other hand, 102 does not have a binary period, because its binary
# representation is "1100110" and it does not have a period.
#
# Write a function in Ruby 1.9:
#
# def solution(n)
#
# that, given a positive integer N, returns the binary period of N. The function should return −1 if N
# does not have a binary period.
#
# For example, given N = 955 the function should return 4, and given N = 102 the function should return −1,
# as explained in the example above.
#
# Assume that:
#
# N is an integer within the range [1..1,000,000,000].
#
# Complexity:
# expected worst-case time complexity is O(log(N)2);
# expected worst-case space complexity is O(log(N)).


def solution(num)
  bin = num.to_s(2)
  search  = bin.length / 2
  found = false
  while !found do
    half = bin.slice(0, search)
    rest = bin.slice(search, bin.length - search)
    found = rest.start_with?(half) || search == 0
    search -= 1 unless found
  end
  search == 0 ? -1 : search
end

# Note:
#  this was a timed test, and the solution satisfied the test data...
#  that doesn't mean it is correct, or the best approach :)

# November 2013
