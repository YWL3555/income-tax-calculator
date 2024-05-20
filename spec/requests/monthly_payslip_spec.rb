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
                "monthly_income_tax" => 258.33,
                "net_monthly_income" => 4741.67,
              }
              responseBody = JSON.parse(response.body)
              responseBody.delete("timestamp")
              responseBody.delete("annual_salary")
              expect(responseBody).to eq(expected_response)
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
                "monthly_income_tax" => 2891.67,
                "net_monthly_income" => 13775.0,
              }
              responseBody = JSON.parse(response.body)
              responseBody.delete("timestamp")
              responseBody.delete("annual_salary")
              expect(responseBody).to eq(expected_response)
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
                "monthly_income_tax" => 544.33,
                "net_monthly_income" => 6134.84,
              }
              responseBody = JSON.parse(response.body)
              responseBody.delete("timestamp")
              responseBody.delete("annual_salary")
              expect(responseBody).to eq(expected_response)
            end
        end

        context "with valid params" do
            let(:employee_name) { "John" }
            let(:annual_salary) { 80000 }
            let(:params) { { employee_name: employee_name, annual_salary: annual_salary } }

            it "creates a new Tax Record" do
              expect {
                post "/monthly_payslip", params: params
              }.to change(TaxRecord, :count).by(1)
            end
      
            it "saves the tax record to the database" do
              post "/monthly_payslip", params: params
              record = TaxRecord.last
              expect(record.employee_name).to eq(employee_name)
              expect(record.annual_salary).to eq('80000.00')
              expect(record.monthly_income_tax).to eq('541.67')
            end
        end

        context "with invalid params" do
            let(:employee_name) { "John" }
            let(:annual_salary) { "blablabla" }
            let(:params) { { employee_name: employee_name, annual_salary: annual_salary } }

            it "returns status code 400" do
              post "/monthly_payslip", params: params
              expect(response).to have_http_status(400)
            end

        end

    end
end