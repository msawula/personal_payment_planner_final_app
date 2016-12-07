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


    #where my additional code should be
    render("userinteractionpages/timeline.html.erb")
  end


end
