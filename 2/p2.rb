res = File.open('input.txt').readlines.map(&:chomp).map do |line|
    game_id = line.split(":").first.scan(/\d+/).first

    games = line.split(":").last.split(";").map do |round|
        red = round.scan(/\d+ red/).first || 0
        green = round.scan(/\d+ green/).first || 0
        blue = round.scan(/\d+ blue/).first || 0

        [red.to_i, green.to_i, blue.to_i]
    end

    min_red = games.map{ |game| game[0]}.max
    min_green = games.map{ |game| game[1]}.max
    min_blue = games.map{ |game| game[2]}.max

    min_red * min_green * min_blue
end.sum


puts res
