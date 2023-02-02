class EmployeesController < ApplicationController
    skip_before_action :verify_authenticity_token
    def monthly_payslip
      employee = Employee.new(params[:employee_name], params[:annual_salary].to_f)
      employee.generate_monthly_payslip
      TaxRecord.create!(
        timestamp: Time.now.to_s, 
        employee_name: employee.name, 
        annual_salary: sprintf('%.2f', employee.annual_salary).to_s, 
        monthly_income_tax: sprintf('%.2f', employee.monthly_tax).to_s
      )
      render json: {
        employee_name: employee.name,
        gross_monthly_income: employee.gross_monthly_income,
        monthly_income_tax: employee.monthly_tax,
        net_monthly_income: employee.net_monthly_income
      }
    end
  end

  