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
    employee = Employee.new("Jack", 60000)
    employee.generate_monthly_payslip
    assert_equal 5000.00, employee.gross_monthly_income
    assert_equal 500.00, employee.monthly_tax
    assert_equal 4500.00, employee.net_monthly_income
  end

  def test_generate_monthly_payslip_200000
    employee = Employee.new("Ren", 200000)
    employee.generate_monthly_payslip
    assert_equal 16666.67, employee.gross_monthly_income
    assert_equal 4000.00, employee.monthly_tax
    assert_equal 12666.67, employee.net_monthly_income
  end

  def test_generate_monthly_payslip_80150
    employee = Employee.new("Mark", 80150)
    employee.generate_monthly_payslip
    assert_equal 6679.17, employee.gross_monthly_income
    assert_equal 837.08, employee.monthly_tax
    assert_equal 5842.09, employee.net_monthly_income
  end
end
