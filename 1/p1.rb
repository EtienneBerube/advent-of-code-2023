res = File.open('input.txt').readlines.map(&:chomp).map do |line|
    [
        line.scan(/\d/).first,
        line.scan(/\d/).last
    ]
end.map { |v1, v2| "#{v1}#{v2}"}.map(&:to_i).sum


puts res
