class PagesController < ApplicationController
    def home
        @tax_records = TaxRecord.all
    end
end