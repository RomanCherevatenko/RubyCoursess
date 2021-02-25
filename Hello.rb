def number_is_luhn_valid?(number_from_consol = gets.chomp)

  card_number = number_from_consol.tr(' _', '')

  if card_number.to_i.to_s.length != 16
    puts "wrong number"
    return
  end
  cc_digits = card_number.reverse.chars.map(&:to_i)
  check_sum = 0
  cc_digits.each_slice(2) do |odd, even|
    check_sum += odd
    next unless even
    even *= 2
    even = even.divmod(10).inject(:+) if even > 9
    check_sum += even
  end

  puts check_sum.modulo(10) == 0
end

number_is_luhn_valid?



