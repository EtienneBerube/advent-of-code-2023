require "byebug"

def find_numbers(matrix, line_index, symbol_index)
    right, left, top, bottom = 0

    # Necessary
    right = process_position(matrix,line_index, symbol_index+1)
    left = process_position(matrix,line_index,symbol_index-1)

    # possible
    top = process_position(matrix,line_index-1,symbol_index)
    if top == 0
        top += process_position(matrix,line_index-1,symbol_index-1)
        top += process_position(matrix,line_index-1,symbol_index+1)
    end

    bottom = process_position(matrix,line_index+1,symbol_index)
    if bottom == 0
        bottom += process_position(matrix,line_index+1,symbol_index-1)
        bottom += process_position(matrix,line_index+1,symbol_index+1)
    end

    right + left + top + bottom
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
        puts "processing: #{matrix[line][i]}"
        break if matrix[line][i].match?(/\D/)
        num << matrix[line][i]
    end
    puts "found: #{num}"

    num.to_i
end


matrix = []
sum = 0

File.readlines('input.txt', chomp: true).each do |line|
    matrix << line.split("")
end

matrix.each_with_index do |line, line_index|
    line.each_with_index do |symbol, char_index|
        puts "Symbol: #{symbol}" if symbol.match?(/[^0-9\.]/)
        sum += find_numbers(matrix, line_index, char_index) if symbol.match?(/[^0-9\.]/)
    end
end

puts sum
