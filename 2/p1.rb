LOOKING_FOR = [12, 13, 14]

res = File.open('input.txt').readlines.map(&:chomp).each_with_object([]) do |line, arr|
    game_id = line.split(":").first.scan(/\d+/).first

    games = line.split(":").last.split(";").map do |round|
        red = round.scan(/\d+ red/).first || 0
        green = round.scan(/\d+ green/).first || 0
        blue = round.scan(/\d+ blue/).first || 0

        [red.to_i, green.to_i, blue.to_i]
    end

    if games.all? { |game| game[0] <= LOOKING_FOR[0] && game[1] <= LOOKING_FOR[1] && game[2] <= LOOKING_FOR[2] }
        arr << game_id.to_i
    end

end.sum


puts res
