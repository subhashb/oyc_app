class BookfairsController < ApplicationController
  # GET /bookfairs
  # GET /bookfairs.xml
  def index
    @bookfairs = Bookfair.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bookfairs }
    end
  end

  # GET /bookfairs/1
  # GET /bookfairs/1.xml
  def show
    @bookfair = Bookfair.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bookfair }
    end
  end

  # GET /bookfairs/new
  # GET /bookfairs/new.xml
  def new
    @bookfair = Bookfair.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bookfair }
    end
  end

  # GET /bookfairs/1/edit
  def edit
    @bookfair = Bookfair.find(params[:id])
  end

  # POST /bookfairs
  # POST /bookfairs.xml
  def create
    @bookfair = Bookfair.new(params[:bookfair])

    respond_to do |format|
      if @bookfair.save
        format.html { redirect_to(@bookfair, :notice => 'Bookfair was successfully created.') }
        format.xml  { render :xml => @bookfair, :status => :created, :location => @bookfair }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bookfair.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bookfairs/1
  # PUT /bookfairs/1.xml
  def update
    @bookfair = Bookfair.find(params[:id])

    respond_to do |format|
      if @bookfair.update_attributes(params[:bookfair])
        format.html { redirect_to(@bookfair, :notice => 'Bookfair was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bookfair.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bookfairs/1
  # DELETE /bookfairs/1.xml
  def destroy
    @bookfair = Bookfair.find(params[:id])
    @bookfair.destroy

    respond_to do |format|
      format.html { redirect_to(bookfairs_url) }
      format.xml  { head :ok }
    end
  end
end
