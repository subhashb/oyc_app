class TitlereceiptsController < ApplicationController
  # GET /titlereceipts
  # GET /titlereceipts.xml
  def index
    @titlereceipts = Titlereceipt.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @titlereceipts }
    end
  end

  # GET /titlereceipts/1
  # GET /titlereceipts/1.xml
  def show
    @titlereceipt = Titlereceipt.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @titlereceipt }
    end
  end

  # GET /titlereceipts/new
  # GET /titlereceipts/new.xml
  def new
    @titlereceipt = Titlereceipt.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @titlereceipt }
    end
  end

  # GET /titlereceipts/1/edit
  def edit
    @titlereceipt = Titlereceipt.find(params[:id])
  end

  # POST /titlereceipts
  # POST /titlereceipts.xml
  def create
    @titlereceipt = Titlereceipt.new
    @titlereceipt.isbn  = params[:titlereceipt][:isbn]
    @titlereceipt.created_by = params[:titlereceipt][:user_id]
    @titlereceipt.modified_by = params[:titlereceipt][:user_id]
    @titlereceipt.invoice_no = Invoice.find_by_supplier_id_and_isbn(params[:titlereceipt][:supplier_id],@titlereceipt.isbn).invoice_no

    respond_to do |format|
      if @titlereceipt.save
        format.html { redirect_to(@titlereceipt, :notice => 'Titlereceipt was successfully created.') }
        format.xml
      else
        #TODO - is there a better way of doing this??
        if @titlereceipt.errors[:isbn].first && @titlereceipt.errors[:isbn].first.include?("quantity")
          flash[:error] = "Order quantity exceeded!"
          format.html { render :new }
          format.xml { render :xml => @titlereceipt, :status => :precondition_failed }
        else
          flash[:error] = "Validations failed!"
          puts @titlereceipt.errors.to_s
          format.html { render :new }
          format.xml { render :xml => @titlereceipt, :status => :not_found }
        end
      end
    end
  end

  # PUT /titlereceipts/1
  # PUT /titlereceipts/1.xml
  def update
    @titlereceipt = Titlereceipt.find(params[:id])

    respond_to do |format|
      if @titlereceipt.update_attributes(params[:titlereceipt])
        format.html { redirect_to(@titlereceipt, :notice => 'Titlereceipt was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @titlereceipt.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /titlereceipts/1
  # DELETE /titlereceipts/1.xml
  def destroy
    @titlereceipt = Titlereceipt.find(params[:id])
    @titlereceipt.destroy

    respond_to do |format|
      format.html { redirect_to(titlereceipts_url) }
      format.xml  { head :ok }
    end
  end
end
