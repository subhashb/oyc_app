class StockaudititemsController < ApplicationController
  # GET /stockaudititems
  # GET /stockaudititems.xml
  def index
    @stockaudititems = Stockaudititem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stockaudititems }
    end
  end

  # GET /stockaudititems/1
  # GET /stockaudititems/1.xml
  def show
    @stockaudititem = Stockaudititem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stockaudititem }
    end
  end

  # GET /stockaudititems/new
  # GET /stockaudititems/new.xml
  def new
    @stockaudititem = Stockaudititem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stockaudititem }
    end
  end

  # GET /stockaudititems/1/edit
  def edit
    @stockaudititem = Stockaudititem.find(params[:id])
  end

  # POST /stockaudititems
  # POST /stockaudititems.xml
  def create
    @stockaudititem = Stockaudititem.new(params[:stockaudititem])

    respond_to do |format|
      if @stockaudititem.save
        format.html { redirect_to(@stockaudititem, :notice => 'Stockaudititem was successfully created.') }
        format.xml
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @stockaudititem, :status => :not_found }
      end
    end
  end

  # PUT /stockaudititems/1
  # PUT /stockaudititems/1.xml
  def update
    @stockaudititem = Stockaudititem.find(params[:id])

    respond_to do |format|
      if @stockaudititem.update_attributes(params[:stockaudititem])
        format.html { redirect_to(@stockaudititem, :notice => 'Stockaudititem was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stockaudititem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stockaudititems/1
  # DELETE /stockaudititems/1.xml
  def destroy
    @stockaudititem = Stockaudititem.find(params[:id])
    @stockaudititem.destroy

    respond_to do |format|
      format.html { redirect_to(stockaudititems_url) }
      format.xml  { head :ok }
    end
  end
end
