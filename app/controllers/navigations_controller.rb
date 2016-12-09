class NavigationsController < ApplicationController

  def splashpage

    render("userinteractionpages/welcome.html.erb")
  end

  def timeline

    @paychecks = Paycheck.where(:user_id => current_user).order(date_received: :desc)
    @bills = Bill.where(:user_id => current_user)

    @previous_paycheck_date = Date.new(2099,1,1)
    @paychecks.each do |paycheck|
      @bills.each do |bill|
        if (bill.date_due < @previous_paycheck_date) && (bill.date_due >= paycheck.date_received)
          bill.paycheck = paycheck
          bill.save
        end
      end
      @previous_paycheck_date = paycheck.date_received

    end

    #where my additional code should be for OPTIMIZED LOGIC
    @previous_paycheck_date = Date.new(2099,1,1)
    @paychecks.each do |paycheck|
      @running_total = paycheck.average_amount
      @bills.each do |bill|
        puts bill.inspect
        if (bill.date_due < @previous_paycheck_date) && (bill.date_due >= paycheck.date_received)
          if (bill.amount_due <= @running_total)
            bill.proposed_paycheck = paycheck
            bill.save
            @running_total = @running_total - bill.amount_due
          else
            bill.proposed_paycheck = nil
            bill.save
          end
        else
          bill.proposed_paycheck = nil
          bill.save
        end
      end
      @previous_paycheck_date = paycheck.date_received
    end
    #where my additional code should end
    render("userinteractionpages/timeline.html.erb")
  end


end
