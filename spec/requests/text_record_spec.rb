require 'rails_helper'

RSpec.describe "Tax Records", type: :request do
    describe "GET /tax_records" do
      
        it "returns a list of tax records" do
          get "/tax_records"
      
          expect(response).to have_http_status(200)
          end
    end
end