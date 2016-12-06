class BillsController < ApplicationController
  def index
    @q = Bill.ransack(params[:q])
    @bills = @q.result(:distinct => true).includes(:paycheck).page(params[:page]).per(10)

    render("bills/index.html.erb")
  end


  def show
    @bill = Bill.find(params[:id])

    render("bills/show.html.erb")
  end

  def new
    @bill = Bill.new

    render("bills/new.html.erb")
  end

  def create
    @bill = Bill.new

    @bill.recipient = params[:recipient]
    @bill.date_due = params[:date_due]
    @bill.amount_due = params[:amount_due]
    @bill.website_to_pay_bill = params[:website_to_pay_bill]
    @bill.paycheck_id = params[:paycheck_id]
    @bill.user_id = params[:user_id]

    save_status = @bill.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bills/new", "/create_bill"
        redirect_to("/bills")
      else
        redirect_back(:fallback_location => "/", :notice => "Bill created successfully.")
      end
    else
      render("bills/new.html.erb")
    end
  end

  def edit
    @bill = Bill.find(params[:id])

    render("bills/edit.html.erb")
  end

  def update
    @bill = Bill.find(params[:id])

    @bill.recipient = params[:recipient]
    @bill.date_due = params[:date_due]
    @bill.amount_due = params[:amount_due]
    @bill.website_to_pay_bill = params[:website_to_pay_bill]
    @bill.paycheck_id = params[:paycheck_id]
    @bill.user_id = params[:user_id]

    save_status = @bill.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bills/#{@bill.id}/edit", "/update_bill"
        redirect_to("/bills/#{@bill.id}", :notice => "Bill updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Bill updated successfully.")
      end
    else
      render("bills/edit.html.erb")
    end
  end

  def destroy
    @bill = Bill.find(params[:id])

    @bill.destroy

    if URI(request.referer).path == "/bills/#{@bill.id}"
      redirect_to("/", :notice => "Bill deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Bill deleted.")
    end
  end
end
