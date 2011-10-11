class AssuntoitensController < ApplicationController
  # GET /assuntoitens
  # GET /assuntoitens.xml
  def index
    @assuntoitens = Assuntoiten.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @assuntoitens }
    end
  end

  # GET /assuntoitens/1
  # GET /assuntoitens/1.xml
  def show
    @assuntoiten = Assuntoiten.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @assuntoiten }
    end
  end

  # GET /assuntoitens/new
  # GET /assuntoitens/new.xml
  def new
    @assuntoiten = Assuntoiten.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @assuntoiten }
    end
  end

  # GET /assuntoitens/1/edit
  def edit
    @assuntoiten = Assuntoiten.find(params[:id])
  end

  # POST /assuntoitens
  # POST /assuntoitens.xml
  def create
    @assuntoiten = Assuntoiten.new(params[:assuntoiten])

    respond_to do |format|
      if @assuntoiten.save
        flash[:notice] = 'Assuntoiten was successfully created.'
        format.html { redirect_to(@assuntoiten) }
        format.xml  { render :xml => @assuntoiten, :status => :created, :location => @assuntoiten }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @assuntoiten.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /assuntoitens/1
  # PUT /assuntoitens/1.xml
  def update
    @assuntoiten = Assuntoiten.find(params[:id])

    respond_to do |format|
      if @assuntoiten.update_attributes(params[:assuntoiten])
        flash[:notice] = 'Assuntoiten was successfully updated.'
        format.html { redirect_to(@assuntoiten) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @assuntoiten.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /assuntoitens/1
  # DELETE /assuntoitens/1.xml
  def destroy
    @assuntoiten = Assuntoiten.find(params[:id])
    @assuntoiten.destroy

    respond_to do |format|
      format.html { redirect_to(assuntoitens_url) }
      format.xml  { head :ok }
    end
  end
end
