require 'redis'

$redis = Redis.new(host: "localhost")

$redis.flushdb

class TaxCalculator
    TAX_BRACKET = [[20000, 0], [40000, 0.1], [80000, 0.2], [180000, 0.3], [Float::INFINITY, 0.4]]
  
    def initialize(annual_salary)
      @annual_salary = annual_salary
    end
  
    def tax
      calc_tax(@annual_salary)
    end
  
    private
  
    def calc_tax(income)
      

      if $redis.exists(income) > 0
        total_tax = $redis.get(income).to_f
        puts "Tax retrived from redis"
      else
        total_tax = 0
        last_amount = 0
        puts "Start calculating"
        TAX_BRACKET.each do |amount, tax_rate|
          if income < amount
            total_tax += (income - last_amount) * tax_rate
            break
          else
            total_tax += (amount - last_amount) * tax_rate
            last_amount = amount
          end
        end
        puts "Set tax to redis"
        $redis.set(income, total_tax)
      end  
      total_tax
    end
end