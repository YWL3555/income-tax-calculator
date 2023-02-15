class TaxCalculator
    TAX_BRACKET = [[5000, 0], [20000, 0.01], [35000, 0.03], [50000, 0.08], [70000, 0.13], [100000, 0.21], [250000, 0.24], [400000, 0.245],[600000, 0.25], [1000000, 0.26], [2000000, 0.28],[Float::INFINITY, 0.3]]
  
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