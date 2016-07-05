require_relative 'bakery'

def print_cost_and_breakdown( c_b )
  sum = c_b.values.reduce( 0 ) do |sum, pack|
    sum + pack[ :count ] * pack[ :price ]
  end.to_f

  puts "$#{ sum }"
  c_b.each do |pack_size, pack|
    puts "    #{ pack[ :count ] } x #{ pack_size } $#{ pack[ :price ].to_f }"
  end
end

$stdin.each_line do |line|
  amount, code = line.split
  print "#{ amount } #{ code } "
  c_b = Bakery.cost_and_breakdown( code, amount.to_i )
  if c_b
    print_cost_and_breakdown( c_b )
  else
    puts 'no solution'
  end
end