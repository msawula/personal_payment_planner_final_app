class NavigationsController < ApplicationController

  def splashpage

    render("userinteractionpages/welcome.html.erb")
  end

  def timeline

@paychecks = Paycheck.where(:user_id => current_user)
@bills = Bill.where(:user_id => current_user)

    render("userinteractionpages/timeline.html.erb")
  end

end
