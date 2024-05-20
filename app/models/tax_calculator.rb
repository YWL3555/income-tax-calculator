class TaxCalculator
    TAX_BRACKETS = [
      { upper_limit: 5000, rate: 0, base_tax: 0 },
      { upper_limit: 20000, rate: 1, base_tax: 0 },
      { upper_limit: 35000, rate: 3, base_tax: 150 },
      { upper_limit: 50000, rate: 8, base_tax: 600 },
      { upper_limit: 70000, rate: 13, base_tax: 1800 },
      { upper_limit: 100000, rate: 21, base_tax: 4400 },
      { upper_limit: 250000, rate: 24, base_tax: 10700 },
      { upper_limit: 400000, rate: 24.5, base_tax: 46700 },
      { upper_limit: 600000, rate: 25, base_tax: 83450 },
      { upper_limit: 1000000, rate: 26, base_tax: 133450 },
      { upper_limit: 2000000, rate: 28, base_tax: 237450 },
      { upper_limit: Float::INFINITY, rate: 30, base_tax: 517450 }
    ]

    def initialize(annual_salary)
      @annual_salary = annual_salary
    end
  
    def tax
      calc_tax(@annual_salary)
    end
  
    private
  
    def calc_tax(income)
      

      if $redis.exists(income) > 0
        tax = $redis.get(income).to_f
        puts "Tax retrived from redis"
      else
        tax = 0
        TAX_BRACKETS.each_with_index do |bracket, index|
          previous_upper_limit = index.zero? ? 0 : TAX_BRACKETS[index - 1][:upper_limit]

          if income <= bracket[:upper_limit]
            # Calculate tax for the income within this bracket
            base_tax = bracket[:base_tax]
            rate = bracket[:rate]
            excess_income = income - previous_upper_limit

            # Calculate the tax using the base tax and the excess income
            tax = base_tax + (excess_income * (rate / 100.0)).round
            break
          end
        end
      end  
      tax
    end
end