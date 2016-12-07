class NavigationsController < ApplicationController

  def splashpage

    render("userinteractionpages/welcome.html.erb")
  end

  def timeline

    @paychecks = Paycheck.where(:user_id => current_user)
    @bills = Bill.where(:user_id => current_user)

    @previous_paycheck_date = Date.new(1900,1,1)
    @paychecks.each do |paycheck|
      @bills.each do |bill|
        if (bill.date_due > @previous_paycheck_date) && (bill.date_due <= paycheck.date_received)
          bill.paycheck = paycheck
          bill.save
        end
      end
      @previous_paycheck_date = paycheck.date_received

    end

    #where my additional code should be
    @opaychecks = @paychecks.dup
    @obills = @bills.dup
    @oprevious_paycheck_date = Date.new(1900,1,1)
    @opaychecks.each do |opaycheck|
      @running_total = opaycheck.average_amount
      @obills.each do |obill|
        if (obill.date_due > @oprevious_paycheck_date) && (obill.date_due <= opaycheck.date_received)
          if (obill.amount_due < @running_total)
            obill.paycheck = opaycheck
            obill.save
            @running_total = @running_total - obill.amount_due
          else
            obill.paycheck = nil
          end
        else
          obill.paycheck = nil
        end
      end
        @oprevious_paycheck_date = opaycheck.date_received
    end



    #where my additional code should end
    render("userinteractionpages/timeline.html.erb")
  end


end
