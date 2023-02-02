require 'rails_helper'

RSpec.describe "Tax Records", type: :request do
    describe "GET /tax_records" do
        before do
            post "/monthly_payslip", params: { employee_name: "First", annual_salary: 10000 }
            post "/monthly_payslip", params: { employee_name: "Second", annual_salary: 10000 }
            post "/monthly_payslip", params: { employee_name: "Third", annual_salary: 10000 }
        end
        
        it "returns a list of tax records" do
          get "/tax_records"
          expect(response).to have_http_status(200)
          json = JSON.parse(response.body)
          expect(json["tax_records"].length).to eq(3)
        end
    end
end