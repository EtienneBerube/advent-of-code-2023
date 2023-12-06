require "byebug"

def find_numbers(matrix, line_index, symbol_index)
    nums = []

    # Necessary
    # left
    nums << process_position(matrix,line_index, symbol_index+1)
    # right
    nums << process_position(matrix,line_index,symbol_index-1)

    # possible
    nums << process_position(matrix,line_index-1,symbol_index)
    if nums.last == 0
        nums << process_position(matrix,line_index-1,symbol_index-1)
        nums << process_position(matrix,line_index-1,symbol_index+1)
    end

    nums << process_position(matrix,line_index+1,symbol_index)
    if nums.last == 0
        nums << process_position(matrix,line_index+1,symbol_index-1)
        nums << process_position(matrix,line_index+1,symbol_index+1)
    end

    nums.reject!(&:zero?)

    if nums.size <= 1
        puts "gear found with #{nums.size} numbers"
        return 0
    end

    puts nums.inspect
    nums.inject(:*)
end

def process_position(matrix, line, pos)
    return 0 if line < 0 || line >= matrix.length
    return 0 if pos < 0 || pos >= matrix[line].length
    return 0 unless matrix[line][pos].match?(/\d/)

    num = matrix[line][pos]

    # check left
    (pos-1).downto(0).each do |i|
        break if matrix[line][i].match?(/\D/)
        num = matrix[line][i] << num
    end
    # check right
    ((pos+1)...(matrix[line].length)).each do |i|
        break if matrix[line][i].match?(/\D/)
        num << matrix[line][i]
    end

    num.to_i
end


matrix = []
sum = 0

File.readlines('input.txt', chomp: true).each do |line|
    matrix << line.split("")
end

matrix.each_with_index do |line, line_index|
    line.each_with_index do |symbol, char_index|
        puts "Symbol: #{symbol}" if symbol.match?(/\*/)
        sum += find_numbers(matrix, line_index, char_index) if symbol.match?(/\*/)
    end
end

puts sum
