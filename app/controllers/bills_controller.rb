class BillsController < ApplicationController
  # GET /bills
  # GET /bills.xml
  def index
    @bills = Bill.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bills }
    end
  end

  # GET /bills/1
  # GET /bills/1.xml
  def show
    @bill = Bill.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bill }
    end
  end

  # GET /bills/new
  # GET /bills/new.xml
  def new
    @bill = Bill.new
    5.times { @bill.billitems.build }

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bill }
    end
  end

  # GET /bills/1/edit
  def edit
    @bill = Bill.find(params[:id])
    5.times { @bill.billitems.build }
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bill }
    end
  end

  # POST /bills
  # POST /bills.xml
  def create
    @bill = Bill.new(params[:bill])

    respond_to do |format|
      if @bill.save
        format.html { redirect_to(@bill, :notice => 'Bill was successfully created.') }
        format.xml
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bill.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bills/1
  # PUT /bills/1.xml
  def update
    @bill = Bill.find(params[:id])
    
    @bill.grossamt = params[:bill][:grossamt]
    @bill.netamt = params[:bill][:netamt]
    @bill.discount = params[:bill][:discount]
    @bill.quantity = params[:bill][:quantity]
    @bill.bookfair_id = params[:bill][:bookfair_id]
    
    items = []
    itemsArray = params[:bill][:items]
    itemsArray.each do |item|
      isbn = Isbn.find_by_isbn(item[1][:isbn])
      if isbn
        billitem = Billitem.new
        billitem.isbn = isbn.isbn
        billitem.bill_id = @bill.id
        #TODO Get Converation Rates
        billitem.conv_rate = 1
        billitem.discount = @bill.discount
        grosslocalamt = isbn.grossamt * billitem.conv_rate
        billitem.netamt = (grosslocalamt) - (grosslocalamt * billitem.discount / 100)
        billitem.save
      end
    end

    respond_to do |format|
      if @bill.save
        format.html { redirect_to(@bill, :notice => 'Bill was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bill.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1
  # DELETE /bills/1.xml
  def destroy
    @bill = Bill.find(params[:id])
    @bill.destroy

    respond_to do |format|
      format.html { redirect_to(bills_url) }
      format.xml  { head :ok }
    end
  end
end
