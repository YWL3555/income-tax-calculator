// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

//= require jquery

import "@hotwired/turbo-rails"
import "controllers"

$(document).ready(function(){
    $("#payslip").submit(function(e) {
    
        e.preventDefault(); // avoid to execute the actual submit of the form.
    
        var form = $(this);
        var actionUrl = form.attr('action');
        
        $.ajax({
            type: "POST",
            url: actionUrl,
            data: form.serialize(), // serializes the form's elements.
            success: function(data)
            {   
               $("#employeeName").text("$"+data.employee_name);
               $("#grossMonthlyIncome").text("$"+data.gross_monthly_income);
               $("#monthlyIncomeTax").text("$"+data.monthly_income_tax);
               $("#netMonthlyIncome").text("$"+data.net_monthly_income);
            }
        });
        
    });
    });