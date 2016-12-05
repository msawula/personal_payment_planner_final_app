class PaychecksController < ApplicationController
  def index
    @paychecks = Paycheck.all

    render("paychecks/index.html.erb")
  end

  def show
    @paycheck = Paycheck.find(params[:id])

    render("paychecks/show.html.erb")
  end

  def new
    @paycheck = Paycheck.new

    render("paychecks/new.html.erb")
  end

  def create
    @paycheck = Paycheck.new

    @paycheck.date_received = params[:date_received]
    @paycheck.average_amount = params[:average_amount]
    @paycheck.income_source = params[:income_source]

    save_status = @paycheck.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/paychecks/new", "/create_paycheck"
        redirect_to("/paychecks")
      else
        redirect_back(:fallback_location => "/", :notice => "Paycheck created successfully.")
      end
    else
      render("paychecks/new.html.erb")
    end
  end

  def edit
    @paycheck = Paycheck.find(params[:id])

    render("paychecks/edit.html.erb")
  end

  def update
    @paycheck = Paycheck.find(params[:id])

    @paycheck.date_received = params[:date_received]
    @paycheck.average_amount = params[:average_amount]
    @paycheck.income_source = params[:income_source]

    save_status = @paycheck.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/paychecks/#{@paycheck.id}/edit", "/update_paycheck"
        redirect_to("/paychecks/#{@paycheck.id}", :notice => "Paycheck updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Paycheck updated successfully.")
      end
    else
      render("paychecks/edit.html.erb")
    end
  end

  def destroy
    @paycheck = Paycheck.find(params[:id])

    @paycheck.destroy

    if URI(request.referer).path == "/paychecks/#{@paycheck.id}"
      redirect_to("/", :notice => "Paycheck deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Paycheck deleted.")
    end
  end
end
