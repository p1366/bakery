# Main module

# Contains:
# * Bakery Products configuration
# * Class methods for lazy caching Product instances

require 'bigdecimal'

require_relative 'bakery/backtracking'
require_relative 'bakery/product'

module Bakery

  # Bakery Products configuration - codes and count/price per pack
  # I dont like muffins and .freeze.freeze.freeze
  PRODUCTS = {
    'VS5' => {
      3 => '6.99',
      5 => '8.99'
    },
    'MB11' => {
      2 => '9.95',
      5 => '16.95',
      8 => '24.95'
    },
    'CF' => {
      3 => '5.95',
      5 => '9.95',
      9 => '16.99'
    }
  }

  class << self
    def products
      @@products ||= {}
    end

    def product( code )
      code  = code.upcase
      packs = PRODUCTS[ code ]
      if packs
        products[ code ] ||= Product.new(
          # Price should be BigDecimal to avoid float losses
          packs.each_with_object( {} ) { |(k, v), memo| memo[ k ] = BigDecimal.new( v ) }
        )
      end
    end

    def cost_and_breakdown( code, amount )
      prod = product( code )
      prod.cost_and_breakdown( amount ) if prod
    end
  end

end
