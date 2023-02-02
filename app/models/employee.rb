class Employee
    attr_reader :name, :annual_salary, :gross_monthly_income, :monthly_tax, :net_monthly_income
  
    def initialize(name, annual_salary)
      @name = name
      @annual_salary = annual_salary
    end
  
    def generate_monthly_payslip
      @gross_monthly_income = (@annual_salary / 12.0).round(2)
      @monthly_tax = (TaxCalculator.new(annual_salary).tax / 12.0).round(2)
      @net_monthly_income = (@gross_monthly_income - @monthly_tax).round(2)

      #print_employee_details      
    end

    private
    def print_employee_details
      puts "Monthly Payslip for: #{@name}"
      puts "Gross Monthly Income: $#{sprintf('%.2f',@gross_monthly_income)}"
      puts "Monthly Income Tax: $#{sprintf('%.2f',@monthly_tax)}"
      puts "Net Monthly Income: $#{sprintf('%.2f',@net_monthly_income)}"
    end
end