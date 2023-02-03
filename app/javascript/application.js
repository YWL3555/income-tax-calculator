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
               $("#employeeName").text(data.employee_name);
               $("#grossMonthlyIncome").text("$"+Number(data.gross_monthly_income).toFixed(2));
               $("#monthlyIncomeTax").text("$"+Number(data.monthly_income_tax).toFixed(2));
               $("#netMonthlyIncome").text("$"+Number(data.net_monthly_income).toFixed(2));
               $("#beforeResult").addClass("hidden");
               $("#result").removeClass("hidden");
               $('#taxRecordTable tr:last').after(
               `<tr class="bg-white border-b ">
                    <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap" >
                        ${data.employee_name}
                    </th>
                    <td class="px-6 py-4">
                       $${Number(data.annual_salary).toFixed(2)}
                    </td>
                    <td class="px-6 py-4">
                        $${Number(data.monthly_income_tax).toFixed(2)}
                    </td>
                    <td class="px-6 py-4">
                        ${data.timestamp}
                    </td>

                </tr>`
               );
            }
        });
        
    });
    });