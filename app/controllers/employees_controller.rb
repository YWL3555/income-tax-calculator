class EmployeesController < ApplicationController
    skip_before_action :verify_authenticity_token
    def monthly_payslip
      employee_name = params[:employee_name]
      annual_salary = params[:annual_salary].to_f

      if annual_salary <= 0
        render json: { error: "Annual salary must be a positive amount." }, status: :bad_request
      else
        employee = Employee.new(employee_name, annual_salary)
        employee.generate_monthly_payslip
        time_now = Time.now.to_s
        TaxRecord.create!(
          timestamp: time_now, 
          employee_name: employee.name, 
          annual_salary: sprintf('%.2f', employee.annual_salary).to_s, 
          monthly_income_tax: sprintf('%.2f', employee.monthly_tax).to_s
        )
        render json: {
          employee_name: employee.name,
          gross_monthly_income: employee.gross_monthly_income,
          monthly_income_tax: employee.monthly_tax,
          net_monthly_income: employee.net_monthly_income,
          annual_salary: sprintf('%.2f', employee.annual_salary).to_s,
          timestamp: time_now
        }
      end
    end
  end

  