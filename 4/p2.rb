CardData = Struct.new(:mult, :result)

data = {}

File.open('input.txt')
    .readlines
    .map(&:chomp)
    .map { |line| line.split(":") }
    .map { |card_num, numbers| [card_num.scan(/\d+/).first.to_i, numbers] }
    .each {|card_num, numbers| data[card_num] = CardData.new(1, nil)}
    .map { |card_num, numbers| [card_num, *numbers.split("|").map { |portion| portion.scan(/\d+/).map(&:to_i)}]}
    .each do | card_num, winning, owned |
        data[card_num].result ||= (owned.length - (owned - winning).length)
        ((card_num+1)..(card_num + data[card_num].result)).each do |num|
            next if data[num].nil?
            data[num].mult += data[card_num].mult
        end
    end

puts data.each_value.map(&:mult).sum
