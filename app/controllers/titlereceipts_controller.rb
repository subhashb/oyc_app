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
    @titlereceipt = Titlereceipt.new(params[:titlereceipt])

    respond_to do |format|
      if @titlereceipt.save
        format.html { redirect_to(@titlereceipt, :notice => 'Titlereceipt was successfully created.') }
        format.xml  { render :xml => @titlereceipt, :status => :created, :location => @titlereceipt }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @titlereceipt.errors, :status => :unprocessable_entity }
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
