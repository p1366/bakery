module Bakery
  class Product
    attr_reader :code, :packs, :paker

    def initialize( code, packs, breakdowner_klass = Backtracking )
      @code   = code
      @packs  = packs
      @paker  = breakdowner_klass.new( packs.keys )
    end

    def cost_and_breakdown( amount )
      if amount > 0
        breakdown = paker.pack_breakdown( amount )
        if breakdown
          breakdown.each_with_object( {} ) do |( pack, count ), result|
            result[ pack ] = {
              count: count,
              price: packs[ pack ]
            } if count > 0
          end
        end
      end
    end

  end
end
