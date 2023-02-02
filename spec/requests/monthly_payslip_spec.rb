require 'rails_helper'

RSpec.describe "Monthly Payslip", type: :request do
    describe "POST /monthly_payslip" do
        context "with employee name 'Ren' and annual salary 60000" do
            let(:employee_name) { "Ren" }
            let(:annual_salary) { 60000 }
            let(:params) { { employee_name: employee_name, annual_salary: annual_salary } }
      
            it "returns a JSON response with correct payslip information" do
              post "/monthly_payslip", params: params
      
              expect(response).to have_http_status(:success)
              expect(response.content_type).to eq("application/json; charset=utf-8")
      
              expected_response = {
                "employee_name" => employee_name,
                "gross_monthly_income" => 5000.0,
                "monthly_income_tax" => 500.0,
                "net_monthly_income" => 4500.0,
              }
              expect(JSON.parse(response.body)).to eq(expected_response)
            end
        end

        context "with employee name 'Jack' and annual salary 200000" do
            let(:employee_name) { "Jack" }
            let(:annual_salary) { 200000 }
            let(:params) { { employee_name: employee_name, annual_salary: annual_salary } }
      
            it "returns a JSON response with correct payslip information" do
              post "/monthly_payslip", params: params
      
              expect(response).to have_http_status(:success)
              expect(response.content_type).to eq("application/json; charset=utf-8")
      
              expected_response = {
                "employee_name" => employee_name,
                "gross_monthly_income" => 16666.67,
                "monthly_income_tax" => 4000.0,
                "net_monthly_income" => 12666.67,
              }
              expect(JSON.parse(response.body)).to eq(expected_response)
            end
        end

        context "with employee name 'Mark' and annual salary 80150" do
            let(:employee_name) { "Mark" }
            let(:annual_salary) { 80150 }
            let(:params) { { employee_name: employee_name, annual_salary: annual_salary } }
      
            it "returns a JSON response with correct payslip information" do
              post "/monthly_payslip", params: params
      
              expect(response).to have_http_status(:success)
              expect(response.content_type).to eq("application/json; charset=utf-8")
      
              expected_response = {
                "employee_name" => employee_name,
                "gross_monthly_income" => 6679.17,
                "monthly_income_tax" => 837.08,
                "net_monthly_income" => 5842.09,
              }
              expect(JSON.parse(response.body)).to eq(expected_response)
            end
        end
    end
end