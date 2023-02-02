class TaxRecordsController < ApplicationController
    def index
      @tax_records = TaxRecord.all
      render json: { tax_records: @tax_records }, status: :ok
    end
  end