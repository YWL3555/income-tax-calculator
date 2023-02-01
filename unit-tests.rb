require "minitest/autorun"
require "./main"

class TaxCalculatorTest < Minitest::Test
  def test_calc_tax_60000
    tax_calculator = TaxCalculator.new(60000)
    assert_equal 6000.00, tax_calculator.tax
  end
  def test_calc_tax_200000
    tax_calculator = TaxCalculator.new(200000)
    assert_equal 48000.00, tax_calculator.tax
  end
  def test_calc_tax_80150
    tax_calculator = TaxCalculator.new(80150)
    assert_equal 10045.00, tax_calculator.tax
    end
end


class EmployeeTest < Minitest::Test
  def test_generate_monthly_payslip_60000
    employee = Employee.new("Ren", 60000)
    assert_output(
        "Monthly Payslip for: Ren\nGross Monthly Income: $5000.00\nMonthly Income Tax: $500.00\nNet Monthly Income: $4500.00\n"
        ) { employee.generate_monthly_payslip }
  end
  def test_generate_monthly_payslip_200000
    employee = Employee.new("Jack", 200000)
    assert_output(
        "Monthly Payslip for: Jack\nGross Monthly Income: $16666.67\nMonthly Income Tax: $4000.00\nNet Monthly Income: $12666.67\n"
        ) { employee.generate_monthly_payslip }
  end
  def test_generate_monthly_payslip_80150
    employee = Employee.new("Mark", 80150)
    assert_output(
        "Monthly Payslip for: Mark\nGross Monthly Income: $6679.17\nMonthly Income Tax: $837.08\nNet Monthly Income: $5842.09\n"
        ) { employee.generate_monthly_payslip }
  end
end
