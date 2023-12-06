require "byebug"

res = File.open('input.txt')
    .readlines
    .map(&:chomp)
    .map { |line| line.split(":").last }
    .map { |line| line.split("|").map { |portion| portion.scan(/\d+/).map(&:to_i)}}
    .map { | winning, owned | 2**(owned.length - (owned - winning).length - 1)}
    .map(&:to_i)
    .sum

puts res
