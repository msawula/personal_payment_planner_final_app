class NavigationsController < ApplicationController

  def splashpage

    render("userinteractionpages/welcome.html.erb")
  end

  def timeline

@paychecks = Paychecks.all
@bills = Bills.all

    render("userinteractionpages/timeline.html.erb")
  end

end
