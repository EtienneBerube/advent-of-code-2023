DIGITS = {
    "1" => 1,
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
    "one" => 1,
    "two" => 2,
    "three" => 3,
    "four" => 4,
    "five" => 5,
    "six" => 6,
    "seven" => 7,
    "eight" => 8,
    "nine" => 9
}

res = File.open('input.txt').readlines.map(&:chomp).map do |line|

    digits = DIGITS.keys.each_with_object({}){ |digit, hsh| hsh[digit] = [line.index(digit), line.rindex(digit)] }

    first = DIGITS[digits.sort_by{ |k,v| v.first || 99}.first.first]
    last = DIGITS[digits.sort_by{ |k,v| 9 - (v.last || -1)}.first.first]

    [first, last]
end.map { |v1, v2| "#{v1}#{v2}" }.map(&:to_i).sum

puts res
