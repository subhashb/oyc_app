class BillitemsController < ApplicationController
  # GET /billitems
  # GET /billitems.xml
  def index
    @billitems = Billitem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @billitems }
    end
  end

  # GET /billitems/1
  # GET /billitems/1.xml
  def show
    @billitem = Billitem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @billitem }
    end
  end

  # GET /billitems/new
  # GET /billitems/new.xml
  def new
    @billitem = Billitem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @billitem }
    end
  end

  # GET /billitems/1/edit
  def edit
    @billitem = Billitem.find(params[:id])
  end

  # POST /billitems
  # POST /billitems.xml
  def create
    @billitem = Billitem.new(params[:billitem])

    respond_to do |format|
      if @billitem.save
        format.html { redirect_to(@billitem, :notice => 'Billitem was successfully created.') }
        format.xml  { render :xml => @billitem, :status => :created, :location => @billitem }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @billitem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /billitems/1
  # PUT /billitems/1.xml
  def update
    @billitem = Billitem.find(params[:id])

    respond_to do |format|
      if @billitem.update_attributes(params[:billitem])
        format.html { redirect_to(@billitem, :notice => 'Billitem was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @billitem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /billitems/1
  # DELETE /billitems/1.xml
  def destroy
    @billitem = Billitem.find(params[:id])
    @billitem.destroy

    respond_to do |format|
      format.html { redirect_to(billitems_url) }
      format.xml  { head :ok }
    end
  end
end
